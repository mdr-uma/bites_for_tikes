Bites for Tikes app
Weekly meals planner for kids

User
1. name
2. email
3. password as password_digest

has_many meals
has_many charts through meals

meal
1. meal_type
2. meal_name
3. note(for instruction if needed)
4. user_id
5. meal_id

belongs_to user
belongs_to chart

chart
1. date
2. days
3. time

has_many meals
has_many users through meals


To do

 -make empty chart visiable 
 -display the error messages
 -handles logged in or not?
 -put the logic on no other users can't visit someone else profile 
 -fix the about page's picture(needs to be small and centered)
 -move copyright logo on bottom in charts index page.
 -need to add omniauth function and scope function.
 -Your fields should be enclosed within a fields_with_errors class



