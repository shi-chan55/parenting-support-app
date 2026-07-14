# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

questions_seed_data = [
  {
    difficulty: "easy",
    title: "ぞうさん",
    body: "おおきいね！おはなが ながいね。",
    hint: "どうぶつえんで みたことあるかな？",
    parent_guide: "「ぞうさんの おはな ながいねー」と いっしょに はなの まねを してみましょう。",
    image_filename: "elephant.png"
  },
  {
    difficulty: "normal",
    title: "うさぎと かめ",
    body: "どっちが はやいかな？いろも みてみよう。",
    hint: "うさぎは みみが ながいね。かめは こうらが あるね。",
    parent_guide: "「どっちが すき？」と きいて、こどもの こたえを うけとめてあげましょう。",
    image_filename: "rabbit_turtle.png"
  },
  {
    difficulty: "hard",
    title: "どうぶつの えんそく",
    body: "みんなで なにを しているのかな？おはなし してみよう。",
    hint: "くまさんは なにを たべているかな？",
    parent_guide: "「もし ◯◯ちゃんも いっしょなら、なにを したい？」と きいて、そうぞうを ふくらませて あげましょう。",
    image_filename: "animal_picnic.png"
  }
]

questions_seed_data.each do |data|
  question = Question.find_or_create_by!(title: data[:title], difficulty: data[:difficulty]) do |q|
    q.body = data[:body]
    q.hint = data[:hint]
    q.parent_guide = data[:parent_guide]
  end

  next if question.images.attached?

  image_path = Rails.root.join("db", "seed_images", data[:image_filename])
  question.images.attach(
    io: File.open(image_path),
    filename: data[:image_filename]
  )
end
