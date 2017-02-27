class InvoicesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @clients = Client.all.where(user: @user)
    @invoices = Invoice.all.where(user: User.find(session[:user_id]))
  end

  def new
    @user = User.find(session[:user_id])
    @invoice = Invoice.new
    @client = Client.find(params[:client][:id])
    @sales = Sale.where(user: @user, client: @client, invoice: nil)
  end

  def create
    #arr.shift will remove the blank "" item at index 0 of the params[:invoice][:id] array
    #if no checkboxes selected, will return empty array [].
    params[:invoice][:id].shift
    if !params[:invoice][:id].empty?
      charges = []
      params[:invoice][:id].each do |sale_id|
        sale = Sale.find(sale_id)
        charges << sale
      end

      invoice = Invoice.new(
        user: User.find(session[:user_id]),
        client: Client.find(params[:client][:id])
      )
      invoice.save

      client = Client.find(params[:client][:id])
      inv_filename = client.first_name + "_" + client.last_name + "_" + invoice.created_at.strftime("%F") + ".pdf"
      invoice.invoice = generate_invoice(inv_filename, client, charges, params[:client][:points].to_i)

      if invoice.save
        client.update(points: client.points - params[:client][:points].to_i)
        charges.each do |charge|
          charge.update_attributes(sales_code: SalesCode.find(2), invoice: invoice)
        end
        flash[:notice] = "Invoice created!"
        redirect_to "/invoices"
      else
        flash[:notice] = "Something went wrong"
        redirect_to '/invoices/new'
      end
    else
      flash[:notice] = "Must select at least 1 item to invoice."
      redirect_to '/invoices/new'
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    send_file @invoice.invoice.path, :filename => @invoice.invoice_file_name, :disposition => 'inline', :type => "application/pdf"
  end

  def destroy
    #Upon deleting invoice, need to change all sales status_codes back to 1
    fail
  end

  def edit
  end

  def update
  end

  private

  def generate_invoice(filename, client, charges, points)
    subtotal = 0
    inv = Prawn::Document.new
    # Prawn::Document.generate("invoice.pdf") do
    inv.float do
      inv.move_down 15
      inv.bounding_box([0, 700], width: 530) do
        inv.move_down 10
        inv.text "Invoice For: #{client.full_name}"
        inv.move_down 10
        inv.stroke_bounds
      end
    end
    inv.move_down 40
    inv.float do
      inv.move_down 15
      inv.bounding_box([0, 600], width: 530) do
        inv.move_down 20
        charges.each do |charge|
          product = charge.product.prod_name + " - Size: " + charge.product.prod_size
          subtotal += charge.sale_price
          inv.text product, align: :left
          inv.text charge.sale_price.to_s, align: :right
        end
        inv.move_down 20
        inv.stroke_bounds
      end
    end
    inv.move_down 600
    inv.float do
      inv.bounding_box([0, 100], width: 530) do
        inv.move_down 20
        inv.text "Subtotal: $#{subtotal}", align: :right
        inv.move_down 5
        inv.text "Points Applied: #{points}", align: :right
        inv.move_down 5
        inv.text "Points Discount: $#{points / 100}", align: :right
        inv.move_down 5
        inv.text "Total: $#{subtotal - (points / 100)}", align: :right
        inv.move_down 20
      end
    end
    attachment = inv.render
    f = StringIO.new(attachment)
    f.class.class_eval { attr_accessor :original_filename, :content_type }
    f.original_filename = filename
    f.content_type = "application/pdf"
    return f #pass this directly into Invoice.find(1).invoice = generate_invoice(f,c,p) then save
  end
  # end
end
