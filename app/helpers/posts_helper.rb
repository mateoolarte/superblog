module PostsHelper
  def form_title
    @post.new_record? ? "Crear post" : "Editar post"
  end
end
