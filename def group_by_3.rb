def group_by_3(x)
	groups = []
	for i in 0...x.length-2
		for j in (i+1)...x.length
			for k in (j+1)...x.length
				puts "[#{x[i]} #{x[j]} #{x[k]}]"
				groups << [x[i],x[j],x[k]]
			end
		end
	end
end

arr = [1,2,3,4,5]
group_by_3(arr)
