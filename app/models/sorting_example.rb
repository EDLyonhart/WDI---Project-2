test = [{user_id:1, has:["a","b","c"], wants:["a","e","g"]},{user_id:2, has:["c","f","g"], wants:["a","b","g"]}, {user_id:3, has:["d","e","c"], wants:["b","f","h"]}]
@test = test.each {|x| x[:check] = "x"}

@test = test.each {|x| x[:score] = (["a","b","c"] & x[:wants]).length}

sorted = @test.sort_by { |k| k[:score] }.reverse

@test.order(score: :asc)

(["a","b","c"] & x[:wants]).length


score = {score:(:has & array[:wants])}


a.each {|x| print x, " -- " }