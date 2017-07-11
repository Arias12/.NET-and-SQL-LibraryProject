SELECT NU.Id, NU.Email
FROM AspNetUsers NU, AspNetUserRoles NUR
where Nu.Id<>NUR.UserId
group by NU.Id, NU.Email