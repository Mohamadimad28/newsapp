class NewsData {
  String? title;
  String? author;
  String? content;
  String? urlToImage;
  String? data;

  NewsData(
    this.title,
    this.author,
    this.content,
    this.data,
    this.urlToImage,
  );

  static List<NewsData> breakingNewsData = [
    NewsData(
        "Teens have abandoned Facebook, Pew study says",
        "Amanda Silberling",
        "Gen Z internet use is on the rise, but the rate at which teens use Facebook is rapidly declining. A Pew Research Center study on teens, technology and social media found that only 32% of teens aged",
        "2022-08-11",
        "https://techcrunch.com/wp-content/uploads/2022/08/fb-exit-2022.jpg?w=711"),
    NewsData(
        "Fox-owned Tubi expands its free streaming service to five Latin American countries",
        "Lauren Forristal",
        "Tubi, the free ad-supported streaming service owned by Fox, is now available in Costa Rica, Ecuador, El Salvador, Guatemala, and Panama — an expansion that has doubled its global footprint and signals the company's interest in capturing more Latin American",
        "2022-08-11",
        "https://techcrunch.com/wp-content/uploads/2022/05/cross-device_wave.png?w=711"),
    NewsData(
        "Massive iron batteries could be key to displacing natural gas from the grid",
        "Tim De Chant",
        "VoltStorage recently raised a Series C worth \$24 million from engine manufacturer Cummins. Its previous rounds included investments from SOSV and EIT InnoEnergy.",
        "2022-08-11",
        "https://techcrunch.com/wp-content/uploads/2022/08/electrical-grid-at-night.jpg?w=600"),
    NewsData(
        "Mark Cuban, Mavericks in hot water over Voyager \"Ponzi scheme\"",
        "Anita Ramaswamy",
        "The class-action lawsuit alleges that Cuban's promotion of now-bankrupt crypto firm Voyager cost investors \$5 billion",
        "2022-08-11",
        "https://techcrunch.com/wp-content/uploads/2016/02/54816c7904ab43c9af6a09d12d936b0e.jpg?w=600"),
  ];
}
