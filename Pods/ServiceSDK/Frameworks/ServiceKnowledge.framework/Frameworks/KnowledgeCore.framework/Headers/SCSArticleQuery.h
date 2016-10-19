/*
 * Copyright 2016 salesforce.com, inc.
 * All rights reserved.
 *
 * Use of this software is subject to the salesforce.com Developerforce Terms of
 * Use and other applicable terms that salesforce.com may make available, as may be
 * amended from time to time. You may not decompile, reverse engineer, disassemble,
 * attempt to derive the source code of, decrypt, modify, or create derivative
 * works of this software, updates thereto, or any part thereof. You may not use
 * the software to engage in any development activity that infringes the rights of
 * a third party, including that which interferes with, damages, or accesses in an
 * unauthorized manner the servers, networks, or other properties or services of
 * salesforce.com or any third party.
 *
 * WITHOUT LIMITING THE GENERALITY OF THE FOREGOING, THE SOFTWARE IS PROVIDED
 * "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. IN NO EVENT SHALL
 * SALESFORCE.COM HAVE ANY LIABILITY FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO,
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, PUNITIVE, OR CONSEQUENTIAL DAMAGES, OR
 * DAMAGES BASED ON LOST PROFITS, DATA OR USE, IN CONNECTION WITH THE SOFTWARE,
 * HOWEVER CAUSED AND, WHETHER IN CONTRACT, TORT OR UNDER ANY OTHER THEORY OF
 * LIABILITY, WHETHER OR NOT YOU HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGES.
 */

#import <Foundation/Foundation.h>
#import "SCDefines.h"

@class SCSCategoryGroup, SCSCategory;
/**
 A `SCSArticleQuery` object manages the criteria to apply when fetching and searching knowledge articles.
 The query object stores the type of search, the search parameters, and/or any filters or constraints
 to apply when searching.
 
 Use this object with [SCSKnowledgeManager fetchArticlesWithQuery:completion:]
 to download articles that match your query. To access already downloaded articles
 matching your query, call [SCSKnowledgeManager articlesMatchingQuery:completion:].
 */
@interface SCSArticleQuery : NSObject

/** Specifies the 18-character article ID. This property cannot be used with <searchTerm>, <queryMethod>, <sortOrder>, or <sortByField>. */
@property (nonatomic, copy) NSString *articleId;

/**
 Specifies the data categories associated with the articles that need to be queried.
 
 Use this property with the <queryMethod> property to further refine the search.
 When specifying multiple categories, the category group must be different for each element.
 @see SCSCategory
 */
@property (nonatomic, strong) NSArray<SCSCategory*> *categories;

/** 
 If the <categories> property is populated, this property determines the method used to
 select articles above, at, below, or above_or_below the specified categories.
 @see SCQueryMethod
 */
@property (nonatomic, assign) SCQueryMethod queryMethod;

/** Specifies the search term to be used to query articles. This property cannot be used with <articleId>, <sortOrder>, or <sortByField>. */
@property (nonatomic, copy) NSString *searchTerm;

/** Specifies the number of articles to fetch.
 
 An org does not return more than 100 results per page. 
 */
@property (nonatomic, assign) NSUInteger pageSize;

/** 
 If the <categories> property is populated, this property specifies the sort order to be used.
 @see SCArticleSortOrder
 */
@property (nonatomic, assign) SCArticleSortOrder sortOrder;


/** 
 If the <categories> property is populated, this property specifies the  article field used for sorting the article list.
 @see SCArticleSortByField
 */
@property (nonatomic, assign) SCArticleSortByField sortByField;

/**
 Whether the query criteria is valid.
 
 If the query is not valid, fetches and article lookups cannot be performed with this object.
 */
@property (nonatomic, readonly, getter=isValid) BOOL valid;

@end
