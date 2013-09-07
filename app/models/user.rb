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

    attr_accessible :username, :email, :password, :password_confirmation


    before_save :encrypt_password

    #class methods
    class << self
        def authenticate(username, password)
            user = User.find_by(username: username)    
            if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
                user
            else
                nil
            end
        end

    end

    def encrypt_password
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

end

