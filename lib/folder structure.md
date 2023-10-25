└── lib
  ├── cache_file.txt
  ├── constents.dart
  ├── core
    ├── errors
      └── failures.dart
    ├── use_cases
      ├── no_param_use_case.dart
      └── use_case.dart
    ├── utils
      ├── api_service.dart
      ├── app_colors.dart
      ├── assets.dart
      ├── dimensions_of_screen.dart
      ├── functions
        ├── custom_launch_url.dart
        └── save_data.dart
      ├── service_locater.dart
      ├── simple_bloc_observer.dart
      └── styles.dart
    └── widgets
      ├── book_item_view.dart
      ├── custom_widgets
        ├── custom_button.dart
        ├── custom_icon_button.dart
        ├── custom_indicator.dart
        ├── custom_search_text_field.dart
        ├── custom_show_snackbar.dart
        └── custom_text_form_field.dart
      ├── delails_of_book_item.dart
      ├── failures
        └── failure_view.dart
      ├── price_and_rating_of_book_item.dart
      └── rating_of_book_item.dart
  ├── Features
    ├── _1_Splash
      └── presentation
        └── views
          ├── bodies
            └── splash_view_body.dart
          ├── splash_view.dart
          └── widgets
            └── animated_text_in_splash_view_body.dart
    ├── _2_home
      ├── book_details_view.dart
      ├── data
        ├── data_sources
          ├── home_local_data_source.dart
          ├── home_local_data_source_impl.dart
          ├── home_remote_data_source.dart
          └── home_remote_data_source_impl.dart
        ├── models
          └── book_model
            ├── access_info.dart
            ├── book_model.dart
            ├── epub.dart
            ├── image_links.dart
            ├── industry_identifier.dart
            ├── list_price.dart
            ├── offer.dart
            ├── panelization_summary.dart
            ├── pdf.dart
            ├── reading_modes.dart
            ├── retail_price.dart
            ├── sale_info.dart
            ├── search_info.dart
            └── volume_info.dart
        └── repos
          └── home_repo_impl.dart
      ├── domain
        ├── entities
          ├── book_entity.dart
          └── book_entity.g.dart
        ├── repos
          └── home_repo.dart
        └── use_cases
          ├── fetch_free_books_cards.dart
          ├── fetch_newest_free_books.dart
          └── fetch_similar_books.dart
      ├── edit_entry_view.dart
      ├── home_view.dart
      └── presentation
        ├── manager
          ├── all_free_books_cubit
            ├── all_free_books_cubit.dart
            └── all_free_books_state.dart
          ├── newest_free_books_cubit
            ├── newest_free_books_cubit.dart
            └── newest_free_books_state.dart
          └── similar_books_cubit
            ├── similar_books_cubit.dart
            └── similar_books_state.dart
        └── views
          ├── bodies
            ├── book_details_view_body.dart
            ├── edit_entry_view_body.dart
            └── home_view_body.dart
          └── widgets
            ├── book_cards_home_list_view.dart
            ├── Custom_widgets
              ├── book_card_item.dart
              ├── custom_book_detail_app_bar.dart
              ├── custom_home_app_bar.dart
              ├── detail_book_section.dart
              ├── pay_and_free_preview_buttons.dart
              ├── rating_of_book_item.dart
              ├── similar_book_section.dart
              └── text_of_detail_of_book_view.dart
            ├── newest_free_books_list_view.dart
            └── similar_book_list_view.dart
    └── _3_search
      └── presentation
        └── views
          ├── bodies
            └── search_view_body.dart
          ├── search_view.dart
          └── widgets
            └── search_books_list_view.dart
  └── main.dart