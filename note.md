Bites for Tikes app
Weekly meals planner for kids

User
1. name
2. email
3. password as password_digest
has_many charts
has_many children

meal
1. meal_type
2. meal_name
3. note(for instruction if needed)
4. user_id
5. meal_id

has_many children
belongs_to chart

chart
1. date
2. days
3. time


has_many meals
has_many children through meals
belongs_to user


child
 1.name

 has_many meals
 has_many charts through meals
 belongs_to meals




To do



