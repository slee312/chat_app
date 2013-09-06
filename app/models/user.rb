class User
    include Mongoid::Document
    field :username, type: String
    field :email, type: String
    field :password_hash, type: String
    field :password_salt, type: String
    
    attr_accessor :password
    validates_uniqueness_of :username
    validates_uniqueness_of :email
    validates_length_of :username, {minimum: 6, maximum: 20}
    validates_length_of :password, {minimum: 6, maximum: 20}
    validates_confirmation_of :password
    validates_presence_of :password


    before_save :encrypt_password

    #class methods
    class << self
        def authenticate(email, password)
            user = User.find_by(email: email)    
            if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
                user
            else
                nil
            end
        end

    end

    def encrypt_password
        password_salt = BCrypt::Engine.generate_salt
        password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

end

