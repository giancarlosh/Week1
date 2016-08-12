require 'date'
class Blog
	attr_accessor :post_array
	def initialize
		@post_array=[]
	end
	def publish_front_page
		@post_array=@post_array.sort_by {|a| a.date}
		@post_array.each do |a|
			puts a.title
			puts a.date
			puts a.text
			puts "-----------"
		end
	end
	def add_post post
		@post_array<<post
	end

	def patro patr
		@post_array[patr-1].title="**********#{@post_array[patr-1].title}************"
	end

end
class Post
	attr_accessor :title, :date, :text
	def initialize title, date, text
		@title=title
		@date= date
		@text=text
	end
end

blog = Blog.new
blog.add_post Post.new("Post title 1",Date.new(2001,2,4),"Post 1 text")
blog.add_post Post.new("Post title 2",Date.new(2008,2,4),"Post 2 text")
blog.add_post Post.new("Post title 3",Date.new(2001,9,4),"Post 3 text")

puts "Que post es patrocinado"
blog.patro gets.chomp.to_i
blog.publish_front_page




