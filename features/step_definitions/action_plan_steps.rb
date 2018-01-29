Given(/^I assign a new action plan task to them$/) do
  click_on @client.name
  click_on 'Action Plan'
  click_on I18n.t('clients.buttons.new_action_plan_task'), match: :first
  @task_title = 'Do Something'
  @due_date = DateTime.now.utc + 7.days
  fill_in 'action_plan_task_title', with: @task_title
  fill_in 'action_plan_task_due_date', with: @due_date.strftime('%d/%m/%Y')
  @achievement_name = I18n.t('advisors.achievement.job_application.achieved')
  select @achievement_name, from: 'action_plan_task_achievement_name'
  click_on I18n.t('clients.buttons.save')
end

Then(/^I should see the task has been recorded$/) do
  @action_plan_task = ActionPlanTask.last
  expect(@action_plan_task.title).to eq(@task_title)
  expect(@action_plan_task.due_date.to_date).to eq(@due_date.to_date)
  check_action_plan(@action_plan_task, 'ongoing')
end

Given(/^my client has an action plan task$/) do
  @action_plan_task = Fabricate(:action_plan_task, client: @client)
end

Given(/^my client has an action plan task with an achievement$/) do
  @achievement = 'job_application'
  @action_plan_task = Fabricate(:action_plan_task, client: @client, achievement_name: @achievement)
end

Given(/^I mark the task as completed$/) do
  first('#action_plan_task_status_completed').click
  click_on I18n.t('clients.buttons.update')
end

Then(/^I should see the task has been completed$/) do
  expect(page).to have_content("Agreed Action: #{@action_plan_task.title} saved")
  check_action_plan(@action_plan_task.reload, 'completed')
end

Then(/^my client should have an achievement recorded$/) do
  expect(@client.achievements.count).to eq(1)
  expect(@client.achievements.first.name).to eq(@achievement)
end
