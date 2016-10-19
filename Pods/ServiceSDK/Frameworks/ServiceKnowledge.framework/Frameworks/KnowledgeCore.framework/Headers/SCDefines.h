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

#ifndef __SCDEFINES_H__
#define __SCDEFINES_H__

@import SalesforceKit;

#ifndef SC_EXTERN
#ifdef __cplusplus
#define SC_EXTERN   extern "C" __attribute__((visibility ("default")))
#else
#define SC_EXTERN   extern __attribute__((visibility ("default")))
#endif
#endif

// Error Domain
SC_EXTERN NSString * const SCSKnowledgeErrorDomain;

SC_EXTERN NSString * const SCSKnowledgeCoreLogIdentifier;

/**
 Download options used when fetching article content.
 
 See `<SCSArticle>` for more info.
 */
typedef NS_ENUM(NSInteger, SCSArticleDownloadOption) {

    /** Include images when downloading article. */
    SCSArticleDownloadOptionImages = 1 << 0,
    /** Refetch article fields from server when downloading. */
    SCSArticleDownloadOptionRefetchArticleContent  = 1 << 1,
};

/**
 * Possible Knowledge error response codes.
 */
typedef NS_ENUM(NSInteger, SCSKnowledgeErrorCode) {
    /**
     No article found.
     */
    SCSKnowledgeErrorCodeNoArticleFound = 1,
    /**
     Unable to write file.
     */
    SCSKnowledgeErrorCodeCannotWriteFile,
     /**
      Data not found.
     */
    SCSKnowledgeErrorCodeDataNotFound,
    SCSKnowledgeErrorCodeInvalidCategory
};

/**
 Knowledge channel type.
 */
typedef NS_ENUM(NSInteger, SCChannelType) {
    /**
     Unknown channel.
     */
    SCChannelTypeUnknown,
    /**
     Internal channel.
     */
    SCChannelTypeInternal,
    /**
     Public channel.
     */
    SCChannelTypePublic,
    /**
     Customer portal channel.
     */
    SCChannelTypeCustomerPortal,
    /**
     Partner portal channel.
     */
    SCChannelTypePartnerPortal
};

/**
 Knowledge article query method.
 */
typedef NS_ENUM(NSInteger, SCQueryMethod) {
    /**
     Unknown query method.
     */
    SCQueryMethodUnknown,
    /**
     Query above the specified category.
     */
    SCQueryMethodAbove,
    /**
     Query below the specified category.
     */
    SCQueryMethodBelow,
    /**
     Query above or below the specified category.
     */
    SCQueryMethodAboveOrBelow,
    /**
     Query within the specified category.
     */
    SCQueryMethodAt
};

/**
 Field to sort articles by.
 */
typedef NS_ENUM(NSInteger, SCArticleSortByField) {
    /**
     Unknown sort field.
     */
    SCArticleSortByFieldUnknown,
    /**
     Sort by last published date.
     */
    SCArticleSortByFieldLastPublishedDate,
    /**
     Sort by title field.
     */
    SCArticleSortByFieldTitle,
    /**
     Sort by view score field.
     */
    SCArticleSortByFieldViewScore
};

/**
 Article sort order.
 */
typedef NS_ENUM(NSInteger, SCArticleSortOrder) {
    /**
     Unknown sort order.
     */
    SCArticleSortOrderUnknown,
    /**
     Sort in an ascending order.
     */
    SCArticleSortOrderAscending,
    /**
     Sort in a descending order.
     */
    SCArticleSortOrderDescending,
};

/**
 The type of article field.
 */
typedef NS_ENUM(NSInteger, SCArticleFieldType) {
    /** Unknown field type. */
    SCArticleFieldTypeUnknown,
    /** Text field type. */
    SCArticleFieldTypeText,
    /** Text area field type. */
    SCArticleFieldTypeTextArea,
    /** Long text area field type. */
    SCArticleFieldTypeLongTextArea,
    /** Rich text field type. */
    SCArticleFieldTypeRichText
};

/**
 The user type for the article action.
 */
typedef NS_ENUM(NSInteger, SCArticleActorUserType) {
    /** Unknown user type. */
    SCArticleActorUserTypeUnknown,
    /** Chatter guest user type. */
    SCArticleActorUserTypeChatterGuest,
    /** Chatter user type. */
    SCArticleActorUserTypeChatterOnly,
    /** Guest user type. */
    SCArticleActorUserTypeGuest,
    /** Internal user type. */
    SCArticleActorUserTypeInternal,
    /** Portal user type. */
    SCArticleActorUserTypePortal,
    /** System user type. */
    SCArticleActorUserTypeSystem
};

SC_EXTERN NSString * SCServiceCloudStringValueForChannelType(SCChannelType type);
SC_EXTERN SCChannelType SCServiceCloudTypeForChannelTypeName(NSString *name);

SC_EXTERN NSString * SCServiceCloudStringValueForQueryMethod(SCQueryMethod type);
SC_EXTERN SCQueryMethod SCServiceCloudTypeForQueryMethodName(NSString *name);

SC_EXTERN NSString * SCServiceCloudStringValueForArticleSortByField(SCArticleSortByField type);
SC_EXTERN SCArticleSortByField SCServiceCloudTypeForArticleSortByField(NSString *name);

SC_EXTERN NSString * SCServiceCloudStringValueForArticleSortOrder(SCArticleSortOrder type);
SC_EXTERN SCArticleSortOrder SCServiceCloudTypeForArticleSortOrder(NSString *name);

SC_EXTERN NSString * SCStringValueForArticleFieldType(SCArticleFieldType type);
SC_EXTERN SCArticleFieldType SCTypeForArticleFieldTypeName(NSString *name);

SC_EXTERN NSString * SCStringValueForArticleActorUserType(SCArticleActorUserType type);
SC_EXTERN SCArticleActorUserType SCArticleActorTypeForUserTypeName(NSString *name);
SC_EXTERN void SCArticleActorUserTypePrimitiveFormatter(id value, CSFPrimitivePointer outputStruct);

#endif
