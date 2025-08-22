Everything about Gen AI is a subset use of machine learning technologies

Machine Learning at it's root nature is nothing beyond just statistical predictors

In more friendly terms, "based on a pattern or sequence, guess what should come next" 

ML doesn't automatically mean expensive computation 
Post-training (which varies based on data size, number of iterations and many other factors), ML can actually be miles cheaper than running a hard-coded algorithm 

The thing is that this processing is only done once, to generate the model, with uses being basically matrix multiplications.
If it was a hard-coded algorithm that did the upscaling with no training data, just logic, the processing is done every time you upscale.

Eventually, researchers realized you could use the output of a prediction back as the input to continue creating elements in a sequence 
Obviously, everything in ML just numbers and nothing beyond that, but understanding the importance of each number in a sequence generated what we call "attention" in machine learning 

But what happens if we try applying this back to sequences of numbers? A model would be able to know which elements affected the sequence the most and use that to statistically infer the next element in the sequence...
And this is the basis that originated the Transformer architecture, which allows the illusion of attention and memory in computer models (and that is the basis for LLMs like ChatGPT - the "T" stands for Transformer) 
Under the surface of it, there's actually many smaller ML models in different steps that do numerical predictions of what comes next in a sequence, but words are treated as numbers under the hood (which we call "tokens")

In reality, when you type something in ChatGPT, it really isn't getting a prompt like "give me 5 ideas for traveling destinations", but "489528 85927487 2749574 27485892 7249548 284795482 8257492"
Which are the respective tokens for these words
Then it tries to statistically infer what number should come next, then it goes "01902393", then "98273995", and so on until it either reaches a token number corresponding to a stopping point or it's input capacity runs out
Then it converts back all the numbers it generated back to words
"But wait, if all a ML does is generate numbers using statistic predictions, does it really have any intelligence at all?"
Nope, and it'll never be able to
While everyone who studies this area is still trying to figure out why it is capable of feigning intelligence, ML models don't really have any, they're just wild guessers that, thanks to statistics, have a chance of correctly guessing what would've come next in a sentence 

It's also why it's phrases are so boring and generic: because it attempts to guess the most likely word to come next, which in turn is the most common word to be used in a sentence.

Example: with the prompt "give me 5 ideas for traveling destinations" and response so far "As for travel", it'd guess the word that comes after is "destinations"
"Okay, but what does this have to do with image generation and upscaling?"
The thing about image generation and image upscaling is that, while the process of filling in the gaps, training and everything in between is the same, the difference lies in the starting input and configuration of the model 
When you use something like a text-to-image generator, what happens is the following: The text is transformed into tokens, just like before, and a low-resolution noise image is generated (literally just random white noise that doesn't seem to be anything)

The two are combined together and form an input that goes through a denoiser model to try and apply patterns to the white noise image, which ends up as a extremely blurry weird image (and this is the same process of trying to "guess what number comes next in the sequence" from before)

By iterating multiple times on this weird image to fill in the gaps and increasing the resolution on each iteration, you generate the final image 

This is why images made with Gen AI have that samey artstyle most of the time: because they're always trying to guess the same thing
If you read everything I said so far about how this works, I think one very important question should bubble up
"Is there really a chance that Generative AI can be 'intelligent' given that it's just an algorithm guessing things out of math?" 
No and AGI is impossible by the virtue of ML models alone (or even at all, traditional algorithms are much more capable, precise and effective in that front because MLs always have uncertainty, even over "certain" things) 
That's why I'm so confident that there's nothing to worry about regarding certain jobs or professions like artists ceasing to exist: because Gen AI doesn't make decisions, only wild guesses 

There's only so far you can get by wildly predicting what comes next instead of reasoning about it and making a decision 
That being said, there's a mystery no one has been able to figure out yet and there's a lot of research underway 
How is this wildly guessing process able to feign intelligence so well?
What association is there between it's training data, architecture and output?
It's something nobody from the field still has an answer to and tools are still being created to allow for audition of what's essentially black boxes at this point in time

To summarize, Machine Learning is all about guessing what comes next, and powers everything from AI upscaling to recommendation algorithms to LLMs to audio noise cancellation to background removal to image generation, what differs is the inputs and outputs in it's use cases 
"But you didn't address the matter of training data: after all, is it ethically sourced or not?"
Using ML doesn't automatically mean either: you can collect the data yourself and use it to create your own model for almost anything you want and there are open-source training data archives out there
...but there's a big problem undernearth the surface this that really doesn't have a solution 

How to prove that an entire training data set you sourced from the internet doesn't infringe copyright?

This is something that goes way back to the start of the internet and the issues surrounding it and copyright. 
Because, if we were to actually dig into it, we'd discover that many important models we use today outside of Gen AI/LLMs aren't 100% copyright-safe 
All it really takes is one badly sourced image in a dataset of 10 million images and the problem would already be there
This also opens up a debate about whether a model's use impacts the copyright issues of it's data (Example: if a model for noise cancellation used samples that are copyrighted or taken from someone without permission, is this model infringing copyright?)
We also have the matter that what people consider "good AI" and "bad AI" could have the same skeleton, same training data, same everything... but because of what it's used for, people take a different stance on it

Generating Images? Bad.
Removing Backgrounds? Good.
Same everything beneath the surface, only the use case and purpose being different. 
"I'm done! Machine Learning should be banned, then..."
Given that all Machine Learning is matrix multiplications and statistic inferences, banning Machine Learning is basically like banning math from computers, which in turn is basically banning computers, which is both A. impossible, B. unnecessary 
I'm someone who argues more about banning use cases of the technology and defining clear, auditable boundaries vs banning the technology itself
For example, I think Image and Video Generation should be heavily regulated or outright banned because of it's societal impacts

But ML for background removal, noise cancellation, compression, IK, etc. is something that's fine existing
We'd also sadly need a boundary in regards to where it's okay for training data to not be 100% copyright-free (aka we'd need a dedicated "fair use" clause for training data that's more restrictive than traditional fair use) 
But the only path to address this is through regulation and that will vary a lot from jurisdiction to jurisdiction

A lot of the problem of what I see surrounding ML use cases tends to settle down into two questions:
"Are you okay with someone else making the decisions for you or not? Are you happy with overseeing or iterating over decisions that are basically wild guesses?"
"Does the use case reach the uncanny valley where humans start preferring AI making things over humans, even if the quality is only 'good enough' at best and 'misleading' at worst?" (because they'll never reach any sense of intelligence)
 
For the TL;DR
Gen AI is basically structured using Machine Learning with the specific use case of wildly guessing to generate content, but it does not really have any intelligence to itself
Jobs are not going to cease to exist, but we're going to have a problem long-term because business people won't figure this out until one of the big AI companies break or their own business do
Ethically sourced training data is a challenge in the area since it's conception, but public perception tends to change depending on the use case of the model, because there's more philosophical issues underneath that cause people to evaluate them as "good or bad AI"