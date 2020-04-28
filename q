[1mdiff --git a/app/views/hikes/show_hike.erb b/app/views/hikes/show_hike.erb[m
[1mindex 1c3e195..d9619e8 100644[m
[1m--- a/app/views/hikes/show_hike.erb[m
[1m+++ b/app/views/hikes/show_hike.erb[m
[36m@@ -1,7 +1,7 @@[m
 <a href="/hikes"><p>The Hikes</p></a>[m
 [m
 <h1> <%= @hike.name %> </h1>[m
[31m-<p>created by <%=@hike.user.username%> </p>[m
[32m+[m[32m<a href=""><p>created by <%=@hike.user.username%> </p></a>[m
 [m
 <h3> Difficulty <%= @hike.difficulty %> </h3>[m
 <h3> Rating <%= @hike.rating %> </h3>[m
