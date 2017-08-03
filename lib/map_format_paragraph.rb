# input: array of strings, which are 'sentences'
# output: one long string, where a space character
        # has been added to the end of each initial string
text = "Hello all my friends. How have you been? Have you heard that Wonder Woman is playing in the movie theater? Today, I am interviewing at Docker. I am excited to meet the team. I have been doing some light studying this morning."

def format_paragraph(text, len = 72, indent = 2)
  sentences = [[]]

  text.split(" ").each do |word|
    if !sentences.first.empty? && (sentences.last + [word]).join(' ').length > len
      sentences << [word]
    else
      sentences.last << word
    end
  end

  indentation = " " * indent
  sentences.map! { |sentence|
    "#{indentation}#{sentence.join(' ')}"
  }.join "\n"

  puts sentences
end

format_paragraph(text)