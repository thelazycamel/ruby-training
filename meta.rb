class SuperStore
  def method_missing(meth, *args)
    if meth =~ /\=$/
      instance_variable_set("@#{meth.to_s.sub(/\=$/, '')}", args.first)
    else
      instance_variable_get("@#{meth}")
    end
  end
end

a = SuperStore.new
a.b = 10
p a.b

a.c = [1, 2, 3]
p a.c