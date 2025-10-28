# Modern CV Template for Quarto

A modern, clean resume/CV and cover letter template for Quarto using Typst, inspired by the [modern-cv](https://github.com/DeveloperPaul123/modern-cv) Typst template and the Awesome-CV LaTeX template.


## Installation

To use this template, you can install it as a Quarto extension:

```bash
quarto use template gordonshotwell/typst-templates/modern-cv
```

## Usage

### Resume/CV Setup

Create a new `.qmd` file with the following YAML header:

```yaml
---
firstname: "Your"
lastname: "Name"
email: "your.email@example.com"
phone: "(555) 123-4567"
github: "yourusername"
linkedin: "yourprofile"
website: "https://yourwebsite.com"
address: "Your Address"
positions:
  - "Your Title"
  - "Your Role"
format:
  modern-cv-typst: default
---
```

### Cover Letter Setup

For a cover letter, add `cover-letter: true` to your YAML header and include recipient information:

```yaml
---
cover-letter: true
firstname: "Your"
lastname: "Name"
email: "your.email@example.com"
phone: "(555) 123-4567"
github: "yourusername"
linkedin: "yourprofile"
website: "https://yourwebsite.com"
address: "Your Address"
recipient: "Ms. Jane Smith"
company: "Company Name"
company-address: "123 Business St, City, ST 12345"
date: "October 28, 2024"
position: "Position Title"
format:
  modern-cv-typst: default
---
```

### Available Options

#### Personal Information
- `firstname`: Your first name
- `lastname`: Your last name
- `email`: Email address (will be linked)
- `phone`: Phone number
- `github`: GitHub username (will link to profile)
- `linkedin`: LinkedIn profile name (will link to profile)
- `website`: Personal website URL
- `address`: Physical address
- `positions`: Array of position titles/roles (CV only)
- `profile-picture`: Path to profile picture (CV only, optional)

#### Cover Letter Specific Options
- `cover-letter`: Set to `true` to use cover letter format
- `recipient`: Recipient's name
- `company`: Company name
- `company-address`: Company address
- `date`: Letter date
- `position`: Position being applied for
- `subject`: Custom subject line (optional, overrides position)

#### Document Settings
- `paper-size`: Paper size (default: "us-letter", also supports "a4")

### Content Sections

#### Experience Section
Use the `cv-entry` function for work experience:

```typst
#cv-entry(
  title: "Job Title",
  location: "Company Name",
  date: "2020 - Present",
  description: [
    - Achievement or responsibility
    - Another achievement
    - Technologies used: Python, JavaScript, etc.
  ]
)
```

#### Education Section
Similar to experience, but for educational background:

```typst
#cv-entry(
  title: "Degree Name",
  location: "University Name",
  date: "2016 - 2020",
  description: [
    - GPA: 3.8/4.0
    - Relevant coursework
    - Academic achievements
  ]
)
```

#### Skills Section
Use the `cv-skills` function for organized skill categories:

```typst
#cv-skills((
  (category: "Programming", items: ("Python", "JavaScript", "Go")),
  (category: "Frameworks", items: ("React", "Node.js", "Django")),
  (category: "Tools", items: ("Git", "Docker", "AWS"))
))
```

### Customization

#### Colors
The template uses a blue accent color by default. You can customize colors by modifying the `typst-template.typ` file:

```typst
#let accent-color = rgb("#2b83ba")  // Change this to your preferred color
#let dark-grey = rgb("#414141")
#let light-grey = rgb("#999999")
```

#### Fonts
The template uses Roboto and Source Sans Pro fonts. Make sure these are installed on your system or available in the Typst web app.

## Requirements

- Quarto 1.4.11 or later
- Typst
- Roboto and Source Sans Pro fonts (for optimal appearance)

## Examples

- See `cv.qmd` for a complete CV example with all sections
- See `cover-letter.qmd` for a cover letter example