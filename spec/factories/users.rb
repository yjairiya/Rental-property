FactoryBot.define do
  factory :user do
    first_name {'yogendra'}
    last_name {'Doe'}
    email {'yogendra@email.com'}
    phone {'9898989898'}
    password {'123123'}
    password_confirmation {'123123'}
    role {'owner'}


    # first_name: 'yogendra',
    # last_name: 'Doe',
    # email: 'yogendra@email.com',
    # phone: '9898989898',
    # password: '123123',
    # password_conformation: '123123',
    # role: 'owner'
  end
  # factory :user do
  #   first_name {'admin1'}
  #   last_name {'admin1'}
  #   email {'admin1@email.com'}
  #   phone {'9898989898'}
  #   password {'123123'}
  #   password_confirmation {'123123'}
  #   role {'admin'}
  # end
end 
