json.id candidate.id
json.city candidate.city
json.experience candidate.experience
technologies = []
candidate.technologies.each do |tech|
    i = tech.index(",")
    j = tech.index("tech") + 6
    t = tech.length - 1
    technologies.push({ name: tech[9...i - 1], is_main_tech: tech[j...t] })
    json.technologies technologies
end
json.created_at candidate.created_at
