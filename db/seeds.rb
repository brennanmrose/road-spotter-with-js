# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Simone Jacobs', email: 'simone@gmail.com', password: 'password')
User.create(name: 'Paloma Cruz', email: 'paloma@gmail.com', password: 'password')
User.create(name: 'Juan Castillo', email: 'juan@gmail.com', password: 'password')
Category.create(name: 'Potholes')
Category.create(name: 'Speed Bumps')
Category.create(name: 'Cyclist Visibility')
ReportedIssue.create(chief_complaint: "There's a giant pothole right in the middle of the road and there's no way around it, I even broke my hubcap! Can you please fix it?", transportation_type: 'driver', street_address: '4889 Main St', locality: 'Philadelphia', region: 'PA', postal_code: '19019', user_id: '1', category_id: '1')
ReportedIssue.create(chief_complaint: "Can you please install a speed bump so my children can play outside? Traffic drives way too fast down our street. Thank you.", transportation_type: 'pedestrian', street_address: '909 Washington Rd', locality: 'Philadelphia', region: 'PA', postal_code: '19093', user_id: '2', category_id: '2')
ReportedIssue.create(chief_complaint: "This road is a deathtrap for bikers! With no warning the bike lane just disappears and shoots you into the middle of traffic. You've gotta fix this.", transportation_type: 'cyclist', street_address: '887 Columbia Blvd', locality: 'Philadelphia', region: 'PA', postal_code: '19093', user_id: '3', category_id: '3')