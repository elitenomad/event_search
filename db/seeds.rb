require 'faker'

1000.times do |n|
  Event.create!(
      title: [
          Faker::Hipster.sentence,
          [Faker::Commerce.product_name, %w(workshop course lesson meditation).sample].join(" "),
          [
              Faker::Dessert.flavor,
              Faker::Dessert.variety,
              "with",
              Faker::Dessert.topping
          ].join(" ")
      ].sample,

      description: [
          Faker::HowIMetYourMother.quote,
          Faker::Hipster.paragraphs(5).join("\n"),
          Faker::Lovecraft.paragraphs(5).join("\n"),
      ].sample,

      starts_at: s = Faker::Date.between(3.days.ago, 168.days.from_now).to_time.advance(hours: (9..21).to_a.sample),
      ends_at: s + rand(5).days + rand(2).hours,
      category: %w(
      Business
      Health
      Family
      Sport
      Community
      Arts
      Fashion
      Holiday
      Music
      Food
      Home
      School
      Lifestyle
    ).sample,
      state: %w(draft published).sample,
      image_url: Faker::LoremPixel.image(
          "600x338",
          false,
          %w(city people animals food nature nightlife).sample,
          rand(10) + 1
      )
  )
end

