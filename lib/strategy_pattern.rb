# This pattern follows the design principle 'Program to an interface not implementation'. It identifies the limiations of inheritance.
# Why has_a relationship(composition) is better than is_a relationship(inheritance). It defines a family of algorithms, encapsulates each
# one, and makes them interchangeable. This lets the algorithm vary independently from clients that use it.

# In Rails devise uses warden as a Rack middleware which uses strategies to authenticate client at runtime. It is built on strategy pattern



require_relative 'share_strategy'

class PhoneCameraApp # Superclass

  include ShareStrategy

  def take
    puts 'It takes the photo!.'
  end

  def edit
    puts 'It edits the photo!.'
  end

  def save
    puts 'Photo saved!.'
  end

  def share(strategy)
    strategy.share
  end

end

class BasicCameraApp < PhoneCameraApp
  def edit
    # super
    puts 'Its edited through BasicCameraApp'
  end
end

class CameraPlusApp < PhoneCameraApp
  def edit
    puts 'Its edited through CameraPlusApp'
  end
end


photo = BasicCameraApp.new
photo.take
photo.edit
photo.save
photo.share(ShareStrategy::Email)
