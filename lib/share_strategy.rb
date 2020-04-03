module ShareStrategy

  class Txt
    def self.share
      puts 'Text format of photo is shared!.'
    end
  end

  class Email
    def self.share
      puts 'Email format of photo is shared!.'
    end
  end

  class Social
    def self.share
      puts 'Shared on social media platform!.'
    end
  end

end
