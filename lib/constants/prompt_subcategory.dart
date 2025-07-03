import 'package:gpt_prompt_builder/features/prompt_generation/domain/models/prompt_subcategory_models.dart';

List<PromptSubCategory> subCategories = <PromptSubCategory>[
  // 1. Общие
  PromptSubCategory(category: 'Общие', subCategory: "Повседневные задачи"),
  PromptSubCategory(category: 'Общие', subCategory: "Организация времени"),
  PromptSubCategory(category: 'Общие', subCategory: "Лайфхаки и советы"),
  PromptSubCategory(category: 'Общие', subCategory: "Мотивация и психология"),
  PromptSubCategory(category: 'Общие', subCategory: "Коммуникация и общение"),
  PromptSubCategory(category: 'Общие', subCategory: "Новости и тренды"),
  PromptSubCategory(
    category: 'Общие',
    subCategory: "Советы по здоровью и фитнесу",
  ),
  PromptSubCategory(category: 'Общие', subCategory: "Управление финансами"),
  PromptSubCategory(category: 'Общие', subCategory: "Творчество и вдохновение"),

  // 2. Креатив и тексты
  PromptSubCategory(
    category: 'Креатив и тексты',
    subCategory: "Написание статей и блогов",
  ),
  PromptSubCategory(
    category: 'Креатив и тексты',
    subCategory: "Сценарии и рассказы",
  ),
  PromptSubCategory(
    category: 'Креатив и тексты',
    subCategory: "Поэзия и лирика",
  ),
  PromptSubCategory(
    category: 'Креатив и тексты',
    subCategory: "Рекламные тексты и слоганы",
  ),
  PromptSubCategory(category: 'Креатив и тексты', subCategory: "Копирайтинг"),
  PromptSubCategory(
    category: 'Креатив и тексты',
    subCategory: "Редактирование и корректура",
  ),
  PromptSubCategory(
    category: 'Креатив и тексты',
    subCategory: "Креативные задания и игры",
  ),
  PromptSubCategory(
    category: 'Креатив и тексты',
    subCategory: "Создание мемов и шуток",
  ),
  PromptSubCategory(
    category: 'Креатив и тексты',
    subCategory: "Креативное мышление",
  ),
  PromptSubCategory(
    category: 'Креатив и тексты',
    subCategory: "Контент для соцсетей",
  ),

  // 3. ИИ и технологии
  PromptSubCategory(
    category: 'ИИ и технологии',
    subCategory: "Машинное обучение",
  ),
  PromptSubCategory(
    category: 'ИИ и технологии',
    subCategory: "Нейросети и глубокое обучение",
  ),
  PromptSubCategory(category: 'ИИ и технологии', subCategory: "Робототехника"),
  PromptSubCategory(
    category: 'ИИ и технологии',
    subCategory: "Обработка естественного языка (NLP)",
  ),
  PromptSubCategory(
    category: 'ИИ и технологии',
    subCategory: "Компьютерное зрение",
  ),
  PromptSubCategory(
    category: 'ИИ и технологии',
    subCategory: "Технологии распознавания речи",
  ),
  PromptSubCategory(
    category: 'ИИ и технологии',
    subCategory: "Автоматизация и боты",
  ),
  PromptSubCategory(category: 'ИИ и технологии', subCategory: "Будущее ИИ"),
  PromptSubCategory(
    category: 'ИИ и технологии',
    subCategory: "Этические вопросы ИИ",
  ),
  PromptSubCategory(
    category: 'ИИ и технологии',
    subCategory: "Обзор и новости технологий",
  ),

  // 4. Разработка кода
  PromptSubCategory(category: 'Разработка кода', subCategory: "Веб-разработка"),
  PromptSubCategory(
    category: 'Разработка кода',
    subCategory: "Мобильная разработка",
  ),
  PromptSubCategory(
    category: 'Разработка кода',
    subCategory: "Backend и серверы",
  ),
  PromptSubCategory(
    category: 'Разработка кода',
    subCategory: "Frontend и UI/UX",
  ),
  PromptSubCategory(
    category: 'Разработка кода',
    subCategory: "Языки программирования",
  ),
  PromptSubCategory(
    category: 'Разработка кода',
    subCategory: "Базы данных и SQL",
  ),
  PromptSubCategory(
    category: 'Разработка кода',
    subCategory: "API и интеграции",
  ),
  PromptSubCategory(
    category: 'Разработка кода',
    subCategory: "Тестирование и отладка",
  ),
  PromptSubCategory(category: 'Разработка кода', subCategory: "DevOps и CI/CD"),
  PromptSubCategory(
    category: 'Разработка кода',
    subCategory: "Open Source и коллаборация",
  ),

  // 5. Обучение и развитие
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Саморазвитие и личностный рост",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Изучение языков",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Онлайн-курсы и платформы",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Методики запоминания",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Навыки критического мышления",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Планирование учебы",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Образовательные игры",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Психология обучения",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Тренировка мозга",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Менторство и коучинг",
  ),
  PromptSubCategory(
    category: 'Обучение и развитие',
    subCategory: "Развитие креативности",
  ),

  // 6. Бизнес и карьера
  PromptSubCategory(
    category: 'Бизнес и карьера',
    subCategory: "Стартапы и предпринимательство",
  ),
  PromptSubCategory(
    category: 'Бизнес и карьера',
    subCategory: "Лидерство и управление командой",
  ),
  PromptSubCategory(
    category: 'Бизнес и карьера',
    subCategory: "Маркетинг и продажи",
  ),
  PromptSubCategory(
    category: 'Бизнес и карьера',
    subCategory: "Финансовое планирование",
  ),
  PromptSubCategory(
    category: 'Бизнес и карьера',
    subCategory: "Карьерный рост и смена профессии",
  ),
  PromptSubCategory(
    category: 'Бизнес и карьера',
    subCategory: "Нетворкинг и связи",
  ),
  PromptSubCategory(category: 'Бизнес и карьера', subCategory: "Личные бренды"),
  PromptSubCategory(
    category: 'Бизнес и карьера',
    subCategory: "Переговоры и убеждение",
  ),
  PromptSubCategory(
    category: 'Бизнес и карьера',
    subCategory: "Аналитика и стратегии",
  ),
  PromptSubCategory(
    category: 'Бизнес и карьера',
    subCategory: "Юридические аспекты бизнеса",
  ),

  // 7. Графика и визуалы
  PromptSubCategory(
    category: 'Графика и визуалы',
    subCategory: "Дизайн интерфейсов (UI/UX)",
  ),
  PromptSubCategory(
    category: 'Графика и визуалы',
    subCategory: "Иллюстрация и арт",
  ),
  PromptSubCategory(
    category: 'Графика и визуалы',
    subCategory: "Фотография и обработка фото",
  ),
  PromptSubCategory(
    category: 'Графика и визуалы',
    subCategory: "Видео и монтаж",
  ),
  PromptSubCategory(
    category: 'Графика и визуалы',
    subCategory: "Анимация и моушн-дизайн",
  ),
  PromptSubCategory(
    category: 'Графика и визуалы',
    subCategory: "3D-моделирование",
  ),
  PromptSubCategory(
    category: 'Графика и визуалы',
    subCategory: "Визуализация данных",
  ),
  PromptSubCategory(
    category: 'Графика и визуалы',
    subCategory: "Цветовые схемы и теория цвета",
  ),
  PromptSubCategory(category: 'Графика и визуалы', subCategory: "Типографика"),
  PromptSubCategory(category: 'Графика и визуалы', subCategory: "Инфографика"),

  // 8. Культура и переводы
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "Литература и книги",
  ),
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "История и традиции",
  ),
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "Искусство и музеи",
  ),
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "Музыка и театры",
  ),
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "Кинематограф",
  ),
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "Языки и диалекты",
  ),
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "Переводческие техники",
  ),
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "Межкультурные коммуникации",
  ),
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "Фольклор и мифология",
  ),
  PromptSubCategory(
    category: 'Культура и переводы',
    subCategory: "Современные культурные тренды",
  ),

  // 9. Развлечения
  PromptSubCategory(category: 'Развлечения', subCategory: "Игры и геймдизайн"),
  PromptSubCategory(category: 'Развлечения', subCategory: "Кино и сериалы"),
  PromptSubCategory(category: 'Развлечения', subCategory: "Музыка и плейлисты"),
  PromptSubCategory(category: 'Развлечения', subCategory: "Юмор и мемы"),
  PromptSubCategory(
    category: 'Развлечения',
    subCategory: "Путешествия и туризм",
  ),
  PromptSubCategory(category: 'Развлечения', subCategory: "Хобби и DIY"),
  PromptSubCategory(
    category: 'Развлечения',
    subCategory: "Косплей и фан-культура",
  ),
  PromptSubCategory(
    category: 'Развлечения',
    subCategory: "Вечеринки и события",
  ),
  PromptSubCategory(category: 'Развлечения', subCategory: "Книги и комиксы"),
  PromptSubCategory(
    category: 'Развлечения',
    subCategory: "Видеоблоги и стриминг",
  ),
];
