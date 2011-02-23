RailsAdmin.authenticate_with { authenticate_admin! }

# Read https://github.com/sferik/rails_admin for more options
# Examples:
#
#   RailsAdmin.config do |config|
#     config.models do
#       list do
#         sort_by :updated_at
#         sort_reverse true
#       end
#     end
#   
#     config.model MyModel do
#       edit do
#         field :description, :text do
#           ckeditor do 
#             true
#           end
#         end
#       end
#     end
#   end
