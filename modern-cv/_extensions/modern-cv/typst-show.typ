$if(cover-letter)$
#show: modern-cover-letter.with(
$if(firstname)$
  firstname: "$firstname$",
$endif$
$if(lastname)$
  lastname: "$lastname$",
$endif$
$if(email)$
  email: "$email$",
$endif$
$if(phone)$
  phone: "$phone$",
$endif$
$if(github)$
  github: "$github$",
$endif$
$if(linkedin)$
  linkedin: "$linkedin$",
$endif$
$if(website)$
  website: "$website$",
$endif$
$if(address)$
  address: "$address$",
$endif$
$if(recipient)$
  recipient: "$recipient$",
$endif$
$if(company)$
  company: "$company$",
$endif$
$if(company-address)$
  company-address: "$company-address$",
$endif$
$if(date)$
  date: "$date$",
$endif$
$if(subject)$
  subject: "$subject$",
$endif$
$if(position)$
  position: "$position$",
$endif$
$if(paper-size)$
  paper-size: "$paper-size$",
$endif$
)
$else$
#show: modern-cv.with(
$if(firstname)$
  firstname: "$firstname$",
$endif$
$if(lastname)$
  lastname: "$lastname$",
$endif$
$if(email)$
  email: "$email$",
$endif$
$if(phone)$
  phone: "$phone$",
$endif$
$if(github)$
  github: "$github$",
$endif$
$if(linkedin)$
  linkedin: "$linkedin$",
$endif$
$if(website)$
  website: "$website$",
$endif$
$if(address)$
  address: "$address$",
$endif$
$if(positions)$
  positions: ($for(position)$"$position$"$sep$, $endfor$),
$endif$
$if(profile-picture)$
  profile-picture: "$profile-picture$",
$endif$
$if(paper-size)$
  paper-size: "$paper-size$",
$endif$
)
$endif$
