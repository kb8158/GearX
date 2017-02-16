class ChosenMailer < ApplicationMailer
  def chosen(thing)
    @searcher = thing.searcher
    @thing = thing
    @url = "gear-x.herokuapp.com/things/#{@thing.id}"
    mail(to: @searcher.email, subject: 'Gear found!')
  end
end
