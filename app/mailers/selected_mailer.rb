class SelectedMailer < ApplicationMailer
  def selected(item)
    @lender = item.lender
    @item = item
    @url = "gear-x.herokuapp.com/items/#{@item.id}"
    mail(to: @lender.email, subject: 'Product selected')
  end
end
