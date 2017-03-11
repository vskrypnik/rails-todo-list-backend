user = User.where(email: 'user@example.com').first || User.create(email: 'user@example.com', password: 'password')

FactoryGirl.create_list(:project_with_todos, 3, user: user) if user.projects.empty?
