
# -*- coding:  utf-8  -*-
require 'open-uri'
require 'nokogiri'


class Aaa
		@@img_name=127
		@@user_agent='hehe'
		@@url_num=51
		Chars=('a'..'z').to_a

		def catch_one_page
		
				@@url='http://jandan.net/pic-2013/page-'+@@url_num.to_s+'#comments'	
				doc = Nokogiri::HTML(open(@@url,"User-Agent" => @@user_agent))
				sleep(0.1)
				
				doc.search('//div[@class="vote"]/span[2]').each do |a|
						sleep(0.1)
						if a.content.to_i >2000 then

								img_a_xpath = "//li[@id="+ "\"" + "comment-"+ a['id'].split('-')[1] + "\"]" + "//a[@class=\"view_img_link\"]"
								
								doc.search(img_a_xpath).each do |p|
										File.open(@@img_name, "w") do |f|
											f.write(open(p['href'],"User-Agent" => @@user_agent).read)

											change_img_name

										end
								end
						end

				end
				change_user_agent
				change_url
				
				
		end 

		def change_user_agent
				
				@@user_agent=Chars[rand(26)]+Chars[rand(26)]+Chars[rand(26)]

				puts @@user_agent
		end

		def change_img_name
				@@img_name=(@@img_name.to_i+1).to_s
		end

		def change_url
			  @@url_num  +=1
			  

			  puts @@url
			
		end


end


1.upto(2359) { |n|  Aaa.new.catch_one_page() ; sleep(1)}





