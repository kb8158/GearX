class SelectedMailer < ApplicationMailer
  def selected(item)
    @item = item

    mail(
      to: item.lender.user.email,
      subject: "Your #{item.name} has been selected"
      content: ""
    )
  end
end
