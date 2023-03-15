Very basic example of wicked wizard multistep form for debugging purposes. 

Uses some of the source code from railscast, but their versioning was a bit outdated: 

http://railscasts.com/episodes/346-wizard-forms-with-wicked

In the user_steps_controller.rb I've commented out the turbo_stream code. But if you uncomment it then:

1. Go to `localhost:3000/users/new`
2. Complete the first step of the form with the user's email/password then click "sign up"
3. This directs you to `/user_steps/personal` (representative of step_a) in my previous comment
4. Click on "continue" 

You'll see that the page stays on `/user_steps/personal` instead of advancing to `/user_steps/social`. If you check the network tab, you can see the "append" turbostream that's meant for step_b. If you navigate directly to `/user_steps/social` via URL and click on "modify" partial (which links back to `/user_steps/social?some_variable=world`) it doesn't seem to have the turbostream in the network tab at all
