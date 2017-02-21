# Create admin user
User.create({ email: 'eproduct2017@gmail.com', password: 'eproduct2017test', admin_role: true })

# Create customer user
User.create({ email: 'epcustomer2017@gmail.com', password: 'epcustomer2017test' })
