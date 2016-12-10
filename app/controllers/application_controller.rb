class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def sanitize(obj)
    if obj.is_a?(ActiveRecord::Relation) # && obj.loaded?
      obj.each do |obj|
        sanitize(obj)
      end
    elsif obj.is_a?(ActiveRecord::Base) # && obj.loaded?
      obj.attributes.each do |k, v|
        # v = obj.send(attr.to_sym)
        if v.is_a? String
          obj.send("#{k}=".to_sym, CGI::escapeHTML(v))
        end
        obj.class.reflections.each do |reflection|
          if reflection.is_a? ActiveRecord::Reflection::HasManyReflection
          elsif reflection.is_a? ActiveRecord::Reflection::BelongsToReflection
          end
        end
      end
    elsif obj.is_a? Hash
      obj = obj.dup
      obj.each do |k, v|
        if v.is_a? String
          obj[k] = CGI::escapeHTML(v)
        else
          sanitize(v)
        end
      end
    elsif obj.is_a? Array
      obj.each_with_index do |v, i|
        if v.is_a? String
          obj[i] = CGI::escapeHTML(v)
        else
          sanitize(v)
        end
      end
    end
  end
end
