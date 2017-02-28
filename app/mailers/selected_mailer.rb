class SelectedMailer < ApplicationMailer
  def selected(item, user)
    @item = item
    @user = user
    @url = "gear-x.herokuapp.com/items/#{@item.id}"
    mail(to: @item.lender.email, subject: 'Product selected')
  end
end
