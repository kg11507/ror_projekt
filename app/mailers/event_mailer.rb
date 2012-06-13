class EventMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def event_notify
    mail(:to=>"konradlonsdale@op.pl", :subject=>"test")
  end
  
end
