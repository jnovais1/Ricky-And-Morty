abstract class BaseSerializer < Lucky::Serializer

  def self.for_object(object : BaseModel, *args, **named_args) : Entity
    Entity{self.object_key => new(object, *args, **named_args)}
  end

  def self.for_collection(collection : Enumerable, *args, **named_args)
    {
      # The root key will be the 'self.collection_key' defined on
      # serializers that inherit from this class.
      self.collection_key => collection.map do |object|
        new(object, *args, **named_args)
      end
    }
  end
end
