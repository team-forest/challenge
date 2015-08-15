Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '493535674146430', 'aad181eafa7a555fe70926a5cc2ba13e',
    scope: 'public_profile,user_friends'
end
