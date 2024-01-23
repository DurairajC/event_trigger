module IterableEvent
  BASE_URL =  "https://api.iterable.com/api/"

  # Create event in iterable by using API
  def self.create_event(user_email, name)
    response = HTTParty.post(BASE_URL+'events/trackInAppOpen', {
      headers: {
        'Content-Type': 'application/json',
        'Api-Key' => 'YOUR_ITERABLE_API_KEY'
      },
      body: {
        email: user_email,
        campaignId: 0
      }
    })

    if response.success?
      email_notification(user_email, name) if name == 'Event B'
      JSON.parse(response.body)
    else
      response
    end
  end

  # Send notification to user email by iterable API
  def email_notification(user_email, name)
    response = HTTParty.post(BASE_URL+'email/target', {
      headers: {
        'Content-Type': 'application/json',
        'Api-Key' => 'YOUR_ITERABLE_API_KEY'
      },
      body: {
        campaignId: 0,
        recipientEmail: user_email
      }
    })
  end
end