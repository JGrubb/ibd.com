Development Team Lead on approximately 24 large scale D7 sites for B2B publishing company.  Main responsibilities are maintaining the infrastructure (hosted on Black Mesh), working with C levels to translate business requirements into technical solutions, doing research and discovery on new technologies that might be of use to the business, and working with (currently) 4 reports.

---

### Drupal skills

I've been working with Drupal professionally for 7 years now, starting early in the D6 cycle.  At this point I'm deeply familiar with the standard set of Drupal modules (most things Earl started) as well as the following --

- Apachesolr
- Memcache
- CKEditor
- Media
- Paragraphs
- Fastly
- Services
- "Headless" Drupal

I'm big on structured content as a way out of the morass that is Body field on most sites.  I'm also big on performance and the infrastructure side of the platform.  I much prefer writing code against Drupal than site building and have been wandering deeper into the issue queues of many strategic Drupal modules over the last year.

### Leadership responsibilities

- Set technical and architectural direction for new products and redesigns of old products.
- Work with business stakeholders to come up with the technical solutions for business/product needs.  Constantly on the lookout for useful new technologies and ideas.
- Mentor the other devs and remove roadblocks wherever they may be.  This could be anything from:
    - Discovering and vetting new technologies - AngularJS, MuleESB, Nginx vs HAProxy, any number of AWS solutions
    - Debugging CSS or Javascript issues with front end devs
    - Debugging infrastructure/Varnish/Load balancing/Caching issues with backend devs
    - Brainstorming new Drupal modules, helping to plan the architecture and technical layout, framing out modules for more junior team members.
    - Deep awareness of the entire codebase as well as the infrastructure on which it runs

Lately I've been in a PM role as well, focusing more on delegation and load balancing the incoming workload in addition to the normal senior dev responsibilities.  We use Redmine for a ticket system, and I'm the Rails enthusiast in the company as well, so that also falls under my purview.
  
### Development responsibilities

ABM has been a B2B publishing house with a multi-site Drupal installation at the center of it's publishing infrastructure.  We very recently concluded a hosting migration that cut prices by 60% and increased our compute capacity by 6x at the same time that we conducted a D2D migration from our old codebase to our new one.  Duties include anything and everything - performance tracking and issue mitigation, interfacing with customers internally as well as outside the company.

As I said, we recently refactored our 1st generation Drupal 7 codebase into a much cleaner, smaller, and faster D7 codebase utilizing the Paragraphs module to better structure our content, as well as move us away from the constant headaches caused by a Media.module/WYSIWYG setup.  This system has worked better than expected and provides more benefits from a user standpoint than can be listed in a resume (not to mention the DX benefits).

Outside of Drupal we have many other system that collect lead, process analytics data, etc.  Over the last few years I've --

- Rebuilt the company's corporate website --[http://www.advantagemedia.com/](http://www.advantagemedia.com/) (the front end is entirely mine)
- Rebuilt the company's engine for collecting subscription data - [http://subscriptions.pharmpro.com/](http://subscriptions.pharmpro.com/) (one example out of 26).  This uses AngularJS, Sinatra (rb), and AWS SQS.  Blog posts [here](http://www.ignoredbydinosaurs.com/2014/08/drupal-angular-tidbits-multisite) and [here](http://www.ignoredbydinosaurs.com/2014/08/cool-nginx-feature-of-the-week) on aspects of this project.
- Built an AngularJS-based mobile framework for serving up our brands' websites in a very responsive and modern style.  We were doing "Headless Drupal" before the term was coined.
- Migrated the company's 27 websites (and HTML mobile apps) onto a CDN - [Fastly](http://www.fastly.com/) - and implemented tons of improvements to our caching layer and userland response times.  I'm intimately familiar with Varnish, HTTP headers, and their significance to the business.
- The aforementioned infrastructure migration.  Cut server response times by 75% and hosting costs by 50%+.
- Gained extensive familiarity with Apache Solr and it's integrations with Drupal - have built a heavily customized recommendation engine using Solr MLT and metadata on every piece of content going back 15 years.  Pretty much exactly this - [http://nytlabs.com/blog/2015/10/20/particles/](http://nytlabs.com/blog/2015/10/20/particles/) - except that we beat the NY Times to market with the machine learning/tagging portion.
- Provisioned and built out an ElasticSearch cluster to derive greater intelligence from ALL of our logs from ALL of our platforms.

### Architecture responsibilities

Over the last three years I've moved up from a primarily front end role to being a full stack engineer in a number of different languages and frameworks, to being the primary technical architect of most of the company's technical products and initiatives.

ABM's biggest, newest project is a re-architect/migration from a SQL Server/SSRS data warehouse to a platform based on open source and "cloud" technologies (Postgres and Redshift with Tableau).  I'm leading the infrastructure portion, provisioning and orchestrating the AWS services needed to transition our in-house DW/BI setup into one that will better serve the business going forward.  I'm gaining a fair amount of familiarity with dimensional data modeling in the process.

### For (technical) fun

For fun I hang out in #drupal-support and help new folks out challenges that we all face.  I also have lately been contributing to the Fastly issue queue as well as the Apachesolr and Memcache issue queues.

My drupal.org account is [https://www.drupal.org/u/jgrubb](https://www.drupal.org/u/jgrubb).

I write a mostly technical blog here - [http://www.ignoredbydinosaurs.com/archive](http://www.ignoredbydinosaurs.com/archive) - that chronicles most of what I come across that's not already heavily chronicled.  