# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
	Categories have many reported issues, users have many reported issues
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
	Reported issues belongs to category, reported issue belongs to user
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
	Categories has many users through reported issues and users have many categories through reported issues
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
	Categories have many users through reported issues and users have many categories through reported issues
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
	ReportedIssues has quite a few user submittable attributes
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
	I have implemented both class level validations as well as database level validations for all classes
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
	Users may search reported issues using postal code
- [x] Include signup (how e.g. Devise)
	Signup occurs on the User Controller
- [x] Include login (how e.g. Devise)
	Login occurs on the Sessions Controller
- [x] Include logout (how e.g. Devise)
	Logout is processed on the Sessions Controller
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
	Implemented Omniauth using Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
	ReportedIssues index and show are nested under Category as well as can be found on their own
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
	ReportedIssues new is nested under Category and can also be found on its own
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
	Validation errors are displayed within the fields_with_errors class

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
