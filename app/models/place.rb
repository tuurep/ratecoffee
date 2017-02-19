class Place < OpenStruct
  def self.rendered_fields
    [:name, :formatted_address, :rating ]
  end
end
