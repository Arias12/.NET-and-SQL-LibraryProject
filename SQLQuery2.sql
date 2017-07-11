SELECT NU.Id, NU.Email
FROM AspNetUsers NU, AspNetUserRoles NUR 
where NU.ID!=NUR.UserID