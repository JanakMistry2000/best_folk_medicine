// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_moor.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ArticlesMoor extends DataClass implements Insertable<ArticlesMoor> {
  final int? id;
  final String author;
  final String title;
  final String description;
  final String content;
  final String publishedAt;
  final String urlToImage;
  ArticlesMoor(
      {this.id,
      required this.author,
      required this.title,
      required this.description,
      required this.content,
      required this.publishedAt,
      required this.urlToImage});
  factory ArticlesMoor.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ArticlesMoor(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      publishedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}published_at'])!,
      urlToImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url_to_image'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['author'] = Variable<String>(author);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['content'] = Variable<String>(content);
    map['published_at'] = Variable<String>(publishedAt);
    map['url_to_image'] = Variable<String>(urlToImage);
    return map;
  }

  ArticlesMoorsCompanion toCompanion(bool nullToAbsent) {
    return ArticlesMoorsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      author: Value(author),
      title: Value(title),
      description: Value(description),
      content: Value(content),
      publishedAt: Value(publishedAt),
      urlToImage: Value(urlToImage),
    );
  }

  factory ArticlesMoor.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ArticlesMoor(
      id: serializer.fromJson<int?>(json['id']),
      author: serializer.fromJson<String>(json['author']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      content: serializer.fromJson<String>(json['content']),
      publishedAt: serializer.fromJson<String>(json['publishedAt']),
      urlToImage: serializer.fromJson<String>(json['urlToImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'author': serializer.toJson<String>(author),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'content': serializer.toJson<String>(content),
      'publishedAt': serializer.toJson<String>(publishedAt),
      'urlToImage': serializer.toJson<String>(urlToImage),
    };
  }

  ArticlesMoor copyWith(
          {int? id,
          String? author,
          String? title,
          String? description,
          String? content,
          String? publishedAt,
          String? urlToImage}) =>
      ArticlesMoor(
        id: id ?? this.id,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        content: content ?? this.content,
        publishedAt: publishedAt ?? this.publishedAt,
        urlToImage: urlToImage ?? this.urlToImage,
      );
  @override
  String toString() {
    return (StringBuffer('ArticlesMoor(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('content: $content, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('urlToImage: $urlToImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, author, title, description, content, publishedAt, urlToImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticlesMoor &&
          other.id == this.id &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.content == this.content &&
          other.publishedAt == this.publishedAt &&
          other.urlToImage == this.urlToImage);
}

class ArticlesMoorsCompanion extends UpdateCompanion<ArticlesMoor> {
  final Value<int?> id;
  final Value<String> author;
  final Value<String> title;
  final Value<String> description;
  final Value<String> content;
  final Value<String> publishedAt;
  final Value<String> urlToImage;
  const ArticlesMoorsCompanion({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.content = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.urlToImage = const Value.absent(),
  });
  ArticlesMoorsCompanion.insert({
    this.id = const Value.absent(),
    required String author,
    required String title,
    required String description,
    required String content,
    required String publishedAt,
    required String urlToImage,
  })  : author = Value(author),
        title = Value(title),
        description = Value(description),
        content = Value(content),
        publishedAt = Value(publishedAt),
        urlToImage = Value(urlToImage);
  static Insertable<ArticlesMoor> custom({
    Expression<int?>? id,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? content,
    Expression<String>? publishedAt,
    Expression<String>? urlToImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (content != null) 'content': content,
      if (publishedAt != null) 'published_at': publishedAt,
      if (urlToImage != null) 'url_to_image': urlToImage,
    });
  }

  ArticlesMoorsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? author,
      Value<String>? title,
      Value<String>? description,
      Value<String>? content,
      Value<String>? publishedAt,
      Value<String>? urlToImage}) {
    return ArticlesMoorsCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      content: content ?? this.content,
      publishedAt: publishedAt ?? this.publishedAt,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesMoorsCompanion(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('content: $content, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('urlToImage: $urlToImage')
          ..write(')'))
        .toString();
  }
}

class $ArticlesMoorsTable extends ArticlesMoors
    with TableInfo<$ArticlesMoorsTable, ArticlesMoor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesMoorsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<String?> publishedAt = GeneratedColumn<String?>(
      'published_at', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlToImageMeta = const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String?> urlToImage = GeneratedColumn<String?>(
      'url_to_image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, author, title, description, content, publishedAt, urlToImage];
  @override
  String get aliasedName => _alias ?? 'articles_moors';
  @override
  String get actualTableName => 'articles_moors';
  @override
  VerificationContext validateIntegrity(Insertable<ArticlesMoor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArticlesMoor map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ArticlesMoor.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ArticlesMoorsTable createAlias(String alias) {
    return $ArticlesMoorsTable(attachedDatabase, alias);
  }
}

abstract class _$DatabaseMoor extends GeneratedDatabase {
  _$DatabaseMoor(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ArticlesMoorsTable articlesMoors = $ArticlesMoorsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articlesMoors];
}
