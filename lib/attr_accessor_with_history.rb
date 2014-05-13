class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(args)
        @#{attr_name} = args
        @#{attr_name}_array ||= [nil]
        @#{attr_name}_array << args
      end

      def #{attr_name}_history
        if @#{attr_name}_array.nil? || @#{attr_name}_array.length == 1
          return @#{attr_name}_array
        else
          return @#{attr_name}_array[0..-2]
        end
      end
    }
  end
end
