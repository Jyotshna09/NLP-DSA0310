
import re

# Sample resume received by the recruitment company
resume = """
Name: Arun Kumar
Email: arun.kumar@gmail.com
Mobile: 9876543210
Skills: Python, Java, SQL, Machine Learning, NLP
Experience: 3 years
"""

# Extract candidate name
name_match = re.search(r"Name:\s*(.+)", resume)
name = name_match.group(1).strip() if name_match else "Not found"

# Extract email address
email_match = re.search(r"[\w.-]+@[\w.-]+\.\w+", resume)
email = email_match.group() if email_match else "Not found"

# Extract mobile number
mobile_match = re.search(r"\b[6-9]\d{9}\b", resume)
mobile = mobile_match.group() if mobile_match else "Not found"

# Detect technical skills
skill_list = ["Python", "Java", "SQL", "Machine Learning", "NLP"]
skills = []

for skill in skill_list:
    pattern = r"(?<!\w)" + re.escape(skill) + r"(?!\w)"
    if re.search(pattern, resume, re.IGNORECASE):
        skills.append(skill)

# Extract years of experience
experience_match = re.search(
    r"Experience:\s*(\d+)\s*years?", resume, re.IGNORECASE
)

experience = int(experience_match.group(1)) if experience_match else 0

# Display candidate profile
print("===== CANDIDATE PROFILE =====")
print("Name:", name)
print("Email:", email)
print("Mobile:", mobile)
print("Technical Skills:", ", ".join(skills))
print("Experience:", experience, "years")

# Check shortlisting eligibility
if experience >= 2 and any(s.lower() == "python" for s in skills):
    print("Eligibility: Eligible for shortlisting")
else:
    print("Eligibility: Not eligible for shortlisting")
