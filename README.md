#Welcome to Open Data Quality

###ODQ application is an intranet portal dedicated to data quality assessment.

Based on Business Rules identified and managed through current knowledge base, a companion ETL (Extract, Treat and Load) tool collects statistics about quality of analysed scope of records. Then a companion reporting tool provides dimensional analysis about the quality of your data, enabling drill down to each record to let you correct it.

Use cases:

1. Control of static master data
2. On the fly control of business transactions through an integration middleware
3. Data quality shield surrounding critical applications
4. Data quality firewall for what goes in and out to the cloud
5. Data check prior to migration

Elements of ODQ ecosystem:

    ODQ knowledge base collects errors in an hyper log and lets you discover Business Rules through root cause analysis. ODQ application also provides data governance functionalities through KPI and data quality objectives setup, notifications and data management workflows.  
    ODQ ETL tool collects statistics about good / bad records, and calculates KPIs. It can also be used for ETL and integration purposes. Note that it is still possible to use your own ETL tool instead.  
    ODQ data warehouse is a dedicated start schema storage to enable fast analysis and drill down. It can fit on some databases, depending on their capabilities.  
    ODQ reporting is mainly a functional model that can be hold by various reporting tools. Analysis dimensions herited from the data warehouse are: Time, Business areas hierarchy, Error types, Organisation's hierarchy (list can be extended).


Current development is only related to the knowledge base.
Information about the whole concept is available in the White Paper.

**ODQ team is available for presentation and exchanges about the topic.**

LICENSE:
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

