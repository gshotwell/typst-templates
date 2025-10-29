// Modern CV template for Typst, adapted from modern-cv
// Based on the Awesome-CV LaTeX template

#import "@preview/fontawesome:0.4.0": *

#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 10.00002pt
#let large-size = 11.74988pt
#let huge-size = 14.4pt

// Color scheme
#let accent-color = rgb("#2b83ba")
#let dark-grey = rgb("#414141")
#let light-grey = rgb("#999999")

// Modern CV function
#let modern-cv(
  // Personal information
  firstname: "John",
  lastname: "Doe",
  email: none,
  phone: none,
  github: none,
  linkedin: none,
  website: none,
  address: none,
  positions: (),
  
  // Profile picture
  profile-picture: none,
  
  // Document settings
  paper-size: "us-letter",
  
  // Content
  body
) = {
  
  // Set document properties
  set document(title: firstname + " " + lastname, author: firstname + " " + lastname)
  
  // Set page properties
  set page(
    paper: paper-size,
    margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 2cm),
    header: none,
    footer: none
  )
  
  // Set text properties
  set text(font: ("Roboto", "Source Sans 3", "Arial", "Helvetica"), size: normal-size, fill: dark-grey)
  
  // Configure headings
  show heading.where(level: 1): it => {
    set text(size: large-size, weight: "bold", fill: accent-color)
    v(1em)
    upper(it.body)
    v(0.5em)
    line(length: 100%, stroke: 0.5pt + accent-color)
    v(0.5em)
  }
  
  show heading.where(level: 2): it => {
    set text(size: normal-size, weight: "bold", fill: dark-grey)
    v(0.8em)
    it.body
    v(0.3em)
  }
  
  // Configure links
  show link: it => {
    set text(fill: accent-color)
    it
  }
  
  // Header section with personal info
  {
    set align(center)
    
    // Profile picture (if provided)
    if profile-picture != none {
      image(profile-picture, width: 3cm, height: 3cm)
      v(0.5em)
    }
    
    // Name
    text(size: huge-size, weight: "bold", fill: dark-grey)[
      #firstname #lastname
    ]
    
    v(0.3em)
    
    // Positions
    if positions.len() > 0 {
      text(size: large-size, fill: accent-color, style: "italic")[
        #positions.join(" • ")
      ]
      v(0.5em)
    }
    
    // Contact information
    let contact-info = ()
    
    if email != none {
      let clean-email = email.replace("\\@", "@").replace("~", " ")
      contact-info.push([#fa-envelope() #link("mailto:" + clean-email)[#clean-email]])
    }
    
    if phone != none {
      contact-info.push([#fa-phone() #phone])
    }
    
    if github != none {
      contact-info.push([#fa-github() #link("https://github.com/" + github, github)])
    }
    
    if linkedin != none {
      contact-info.push([#fa-linkedin() #link("https://linkedin.com/in/" + linkedin, linkedin)])
    }
    
    if website != none {
      contact-info.push([#fa-globe() #link(website, website)])
    }
    
    if address != none {
      contact-info.push([#fa-map-marker-alt() #address])
    }
    
    if contact-info.len() > 0 {
      text(size: small-size, fill: light-grey)[
        #contact-info.join(" • ")
      ]
    }
    
    v(1.5em)
  }
  
  // Main content
  set par(justify: true, leading: 0.6em, spacing: 0.6em)
  
  body
}

// CV entry function for experience, education, etc.
#let cv-entry(
  title: "",
  location: "",
  date: "",
  description: none
) = {
  block(width: 100%, breakable: true)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 1em,
      [
        #text(weight: "bold", size: normal-size)[#title] \
        #if location != "" {
          text(size: small-size, fill: light-grey, style: "italic")[#location]
        }
      ],
      [
        #if date != "" {
          text(size: small-size, fill: light-grey)[#date]
        }
      ]
    )
    
    #if description != none {
      v(0.3em)
      description
    }
    
    #v(0.8em)
  ]
}

// Skills section helper
#let cv-skills(skills) = {
  for skill in skills {
    block(width: 100%, breakable: false)[
      #grid(
        columns: (2fr, 5fr),
        column-gutter: 1em,
        [
          #text(weight: "bold", size: small-size)[#skill.category]
        ],
        [
          #text(size: small-size)[#skill.items.join(", ")]
        ]
      )
      #v(0.5em)
    ]
  }
}

// Modern Cover Letter function
#let modern-cover-letter(
  // Personal information
  firstname: "John",
  lastname: "Doe",
  email: none,
  phone: none,
  github: none,
  linkedin: none,
  website: none,
  address: none,
  
  // Recipient information
  recipient: none,
  company: none,
  company-address: none,
  
  // Letter details
  date: none,
  subject: none,
  position: none,
  
  // Document settings
  paper-size: "us-letter",
  
  // Content
  body
) = {
  
  // Set document properties
  set document(title: "Cover Letter - " + firstname + " " + lastname, author: firstname + " " + lastname)
  
  // Set page properties
  set page(
    paper: paper-size,
    margin: (top: 2cm, bottom: 2cm, left: 2.5cm, right: 2.5cm),
    header: none,
    footer: none
  )
  
  // Set text properties
  set text(font: ("Roboto", "Source Sans 3", "Arial", "Helvetica"), size: normal-size, fill: dark-grey)
  
  // Configure links
  show link: it => {
    set text(fill: accent-color)
    it
  }
  
  // Header section with personal info (compact version)
  {
    // Name
    text(size: large-size, weight: "bold", fill: dark-grey)[
      #firstname #lastname
    ]
    
    v(0.3em)
    
    // Contact information in a single line
    let contact-info = ()
    
    if email != none {
      let clean-email = email.replace("\\@", "@").replace("~", " ")
      contact-info.push([#fa-envelope() #link("mailto:" + clean-email)[#clean-email]])
    }
    
    if phone != none {
      contact-info.push([#fa-phone() #phone])
    }
    
    if github != none {
      contact-info.push([#fa-github() #link("https://github.com/" + github, github)])
    }
    
    if linkedin != none {
      contact-info.push([#fa-linkedin() #link("https://linkedin.com/in/" + linkedin, linkedin)])
    }
    
    if website != none {
      contact-info.push([#fa-globe() #link(website, website)])
    }
    
    if contact-info.len() > 0 {
      text(size: small-size, fill: light-grey)[
        #contact-info.join(" • ")
      ]
    }
    
    if address != none {
      v(0.2em)
      text(size: small-size, fill: light-grey)[#address]
    }
    
    v(2em)
  }
  
  // Date (right-aligned)
  if date != none {
    align(right)[
      #text(size: small-size, fill: light-grey)[#date]
    ]
    v(1.5em)
  }
  
  // Recipient information
  if recipient != none or company != none {
    if recipient != none {
      text(size: normal-size)[#recipient]
      if company != none {
        linebreak()
      }
    }
    
    if company != none {
      text(size: normal-size, weight: "bold")[#company]
    }
    
    if company-address != none {
      v(0.3em)
      text(size: small-size, fill: light-grey)[#company-address]
    }
    
    v(2em)
  }
  
  // Subject line
  if subject != none {
    text(size: normal-size, weight: "bold", fill: accent-color)[
      Re: #subject
    ]
    v(1em)
  } else if position != none {
    text(size: normal-size, weight: "bold", fill: accent-color)[
      Re: Application for #position
    ]
    v(1em)
  }
  
  // Main content
  set par(justify: true, leading: 0.7em, first-line-indent: 0em, spacing: 1em)
  
  body
  
  v(2em)
  
  // Closing
  [Sincerely,]
  
  v(2em)
  
  text(weight: "bold")[#firstname #lastname]
}
