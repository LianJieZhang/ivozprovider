��    �      t              �  @   �  +   	  -   :	  Z   h	  *  �	  '   �
  t     �   �  �     O   �  h   �  4   c  �   �  @   r  G   �  �   �    �  @   �     �  q   �  !   q     �  �   �  P   ^     �     �     �     �  ?   �  
   %     0     >     K     c     k     y  S   �  D   �     "  (   '     P     \  "   e  (   �  ~   �     0     C     H  �   `     �  9   �  }   +  p   �  �     �   �     �  �   �  �   a  w   �  F   h     �     �     �  "   �     �  �     `   �  +   3  Z   _  6   �  T   �     F     ]     s     �     �  )   �  3   �             J   '  P   r  9   �  �   �  a   �  5         O      `   N   g      �      �      �      �      �      !     !  8   )!     b!  D   w!     �!  U   �!  A   2"  G   t"  O   �"  �   #  b   �#     $  8   $     O$  )   U$     $  �   �$  ~   %%  (   �%     �%  h   �%     L&  k  �&  x   8(  �   �(  #   J)  B   n)  �   �)  2   W*  �   �*  K   e+  F   �+  2   �+  �   +,     �,  F   �,    -  5   .     G.  ^   b.  ^   �.  <    /  m   ]/  r  �/  u   >1  8   �1  :   �1  p   (2  T  �2  1   �3  c    4  �   �4  �   5  p   �5  d   )6  _   �6  �   �6  C   �7  X   	8  �   b8  #  I9  3   m:     �:  �   �:  )   N;     x;    �;  X   �<     �<     =     ,=     2=  �   D=     �=     �=     �=     >  
   &>     1>     E>  C   W>  H   �>     �>  /   �>     ?  	   "?  2   ,?  O   _?  y   �?     )@     C@  %   H@  �   n@     �@  O   A  �   QA  z   �A  t   ZB  �   �B     �C  �   �C  �   mD  k   	E  l   uE     �E     �E     F  9   F     TF  �   kF  W   NG  C   �G  Z   �G  1   EH  b   wH     �H     �H     I     I     /I  (   CI  7   lI  &   �I     �I  \   �I  q   0J  L   �J  �   �J  c   �K  G   !L     iL     }L  [   �L     �L     �L  <   �L  "   7M     ZM     wM     �M  D   �M     �M  H   �M  $   8N  d   ]N  T   �N  d   O  T   |O  �   �O  �   yP     Q  A   Q     aQ  +   jQ  	   �Q  �   �Q  �   OR  1   �R      S  �   0S  �   �S  �  NT  �   �U  �   �V  )   EW  F   oW  �   �W  6   uX  �   �X  _   ~Y  I   �Y  5   (Z  �   ^Z     �Z  "   [  7  2[  G   j\  1   �\  �   �\  b   �]  @   �]  �   &^   **Billable calls** sections only list **calls that imply cost**. **Brand configuration** > **Call Registry** **Company configuration** > **Call Registry** **Invoices** section lets **brand operator** to generate invoices to issue to its clients. **It is not possible to re-bill a call that is currently included in an existing invoice**. In other words, if a selected call has a non-empty **Invoice** field, this invoice must be deleted before. The reason behind this logic is that we don't want and invoice containing calls with a wrong price. **Main management** > **Call Registry** *Call Registry* section shows the calls of the whole telephony platform and it is present in three different levels: :ref:`Manual creation of a pricing plan <price_plan>` implied the previous creation of at least one :ref:`price pattern <price_pattern>`. :ref:`call_registry` sections, on the other hand, show all calls, even the ones that do not imply cost, such as internal calls, incoming calls, etc. A pricing plan groups some pricing patterns (prefixes) with their cost details: A pricing plan is linked to an specific company with a period of time in which this asociation is valid. All the calls of the selected period must be billed. Although the above window allowed importing non-recommended format `CSV <https://es.wikipedia.org/wiki/CSV>`_  files, we encourage you to import a file in the proposed format, as it will make this process much easier. And pressing this one we can download the invoice in PDF format: As exposed previously, billing calls depends upon an automatic process: As soon as the call is hung up, they appear in this list. In some minutes time the asynchronous process will set *Metered* to 'yes' and will assign a **price**. At this point, the future brand operator may have noticed that creating thousands of pricing patterns would be a really annoying and time consuming task, as there are 254 countries, each of them with their mobile networks, landline networks, special service numbers, etc. At this point, we can generate the invoice pressing this button: Automatic billing Before generating an example invoice, it is important to understand that invoice creation process uses templates. Bill by seconds, by minutes, etc. Billable calls Billing a call again means setting the price as it is made right now. It uses, therefore, the current configuration of pricing plans not the configuration of the moment the call was made. Billing a call is the **action of setting a price** to a call that implies cost. Billing and Invoices Billing period Brand Brand level By default, this section provides some basic example templates: CSV format Call Registry Call billing Call establishment cost Company Company level Cost per minute Create invoices that show call details and global costs of each of their companies. Create pricing plans to assign a price to calls made by final users. Date Date and time of the call establishment. Destination Duration Each entry shows this information: Each section filters calls conveniently. End date must be a past date. In other words, it is not allowed to generate invoices for future dates o dates including today. Establishment cost Etc. External number dialed. Fixed cost are a constant concept that can be added to invoices that use invoice templates that take into account these fixed costs. Fixed costs Floating numbers **MUST use point as decimal separator**. If *billing period* is set to 1, every second the price will be increased *price per minute* divided by 60 (bill by seconds). If *billing period* is set to 60, every minute the price will be increased *price per minute* (bill by minutes). If with the current configuration (active and applicable pricing plans for a given company and for the specific destination) it won't be possible to bill the call, IvozProvider will prevent its establishment. If you choose one specific call, additional information is shown. This additional information is dependant of the current level (*god*, brand or company) and shows details about call transfers, call forwards, etc. Importing a CSV file In :ref:`noplan_nocall` section the process of creating a *pricing plan* was described quite thoroughly and main concepts were introduced: In order to re-bill some calls (or just one), select them in **Brand configuration** > **Billable calls** and press the button **Bill calls**. In such cases, the call price will be calculated using the price detail of the matching pricing plan with minor metric. In these cases, the *brand operator* can re-bill wrongly billed calls. Invoice Invoice creation Invoice generation Invoice template that will be used Invoice templates It is recommended to double quote alphanumeric entries, though it is not compulsory for single word entries (or entries without odd symbols). **If they contain any comma, they MUST be quoted**. It may happen that the brand operator needs to re-bill an specific call due to multiple reasons: Let's add some fixed costs to this invoice: Lists all the calls of the currently emulated brand, showing which company they belong to: Lists all the calls of the currently emulated company: Lists all the calls of the platform, showing which brand and company they belong to: Main level (god level) Main management (god) Manual creation Manual re-billing Metered (yes/no) Mistake on imported pricing plan/pattern. Multiple pricing plans with incorrect metric value. Not asociated pricing plan. Number Numeric entries can be quoted with double quotes, but it is not mandatory. Once a call that implies cost is hung up, it is listed in :ref:`billable_calls`. Once chosen the CSV file to import, this window turns up: Once the import process is over, we just have to bind the pricing plan to the companies we want following :ref:`the procedure explained in the previous block <pricing_plan_to_company>`. One company may have more than one valid pricing plan for an specific call in an specific moment. Only visible for *god*, shows the brand of each call. Peering contract Prefix Pressing this button we can see which calls have been included in the invoice: Price Price per minute Pricing pattern Pricing pattern description Pricing pattern name Pricing plan Pricing plans Select previously defined fixed costs and their amounts: Set Metered to 'yes' Show if a call is already included in any :ref:`invoice <invoices>`. Shows how long the call lasted. Shows if the asynchronous task that sets the price of each call has parsed each call. Shows the :ref:`Pricing plan <price_plan>` used to set the price. Shows the :ref:`pricing pattern <price_pattern>` used to set the price. Shows which :ref:`Peering contract <peering_contracts>` was used for each call. Since some incoming calls can imply cost (see :ref:`billing of inbound calls <bill_inbound>`), show if the call is an incoming call or an outgoung one. Some minutes later, the billing task will evaluate each unbilled call and will update this fields: Start/End date Take this image as an example (section **Fixed costs**): Taxes Taxes to add to the final cost (e.g. VAT) Template Templates are parsed by `handlebars <https://github.com/XaminProject/handlebars.php>`_ and rendered using `wkhtmltopdf <https://wkhtmltopdf.org/>`_ library. That's why the creation of pricing patterns and pricing plans is done using a `CSV <https://es.wikipedia.org/wiki/CSV>`_ file. The company whose calls will be invoiced The cost of the call. The final goal of this section is to generate invoices with the call that imply cost of a given company. The first step is creating an empty pricing plan to import the prices in (section **Brand configuration** > **Pricing plans**): The helper in the section **Brand configuration** > **Invoice templates** include a summarized explanation of the creation of templates. In the `official site of wkhtmltopdf <https://wkhtmltopdf.org/usage/wkhtmltopdf.txt>`_ there is plenty additional information. You can delve into template expressions `here <http://handlebarsjs.com/expressions.html>`_ as well. The importing process is done in background, letting the brand operator continue doing other stuff while it is finished. The importing system will just bind the price to an existing price pattern or, if prefix doesn't match any existing pricing pattern, it will create one. The order of the columns should be: The price of the call will be increased every billing period unit. The recommended `CSV <https://es.wikipedia.org/wiki/CSV>`_ format is described in the contextual help section, that includes even a link to download an example file: The time period of the calls that will be invoiced These lists therefore include the price of each call (once it is calculated). Since companies are notified about its call's price via invoices issued by **brand operator**, this section is only available at two levels: This block is essential for brand administrators as we will explain how to: This is the key button for the massive pricing pattern import process: This is the process to add a create a new invoice: This way, every **brand operator** can adapt which information is shown and how this information is shown, add logos, graphs, etc.. Type (inbound/outbound) Visible for *god* and *brand operator*, show the company of each call. We can select which column contains which field, in case we want to import a `CSV <https://es.wikipedia.org/wiki/CSV>`_ file in a non-recommended format. We can also decide whether to import the first line or discard it as it may have titles instead of data. We enter the empty pricing plan we have just created: We will cover this topics: We will explain afterwords how these fixed costs can be added to a invoice and in what amount. When a call is about to be established, IvozProvider verifies that it will be able to bill it. Will be included in the invoice and shows the invoice number `CSV <https://es.wikipedia.org/wiki/CSV>`_ export makes possible to download the list for its later analysis. Project-Id-Version: IvozProvider 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2017-08-11 13:44+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: es <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 1.3
 Los listados de llamadas de las secciones **Llamadas facturables** muestran solo las **llamadas que implican coste**. **Configuración de Marca** > **Histórico de llamadas** **Configuración de Empresa** > **Histórico de llamadas** La sección **Facturas** es la que permite al **operador de marca** generar facturas para emitir a sus empresas. **No se puede retarificar una llamada que esté incluida en una factura**. Es decir, si la llamada seleccionada tiene el campo **Factura** con valor, habrá que borrar esta factura previamente. El motivo es estar seguros que no existen facturas con llamadas mal tarificadas: si retarificas una llamada, regeneras la factura que la contiene. **Gestión general** > **Histórico de llamadas** Los históricos de llamadas muestran todas las llamadas de la plataforma y se muestran a 3 niveles: La :ref:`creación manual de un plan de precio <price_plan>` implicaba la creación previa de un :ref:`patrón de precio <price_pattern>`. La gran diferencia respecto a las llamadas del :ref:`call_registry` es que todas las que aparecen aquí implican coste (no aparecen, por tanto, llamadas internas, etc.) **Un plan de precios agrupa un listado de patrones de precio (prefijos de llamada) con sus detalles de precio**: Un plan de precios se asocia a una empresa concreta, indicando el período de validez de dicho plan. Todas las llamadas del tramo escogido tienen que estar facturadas para poder emitir la factura. A pesar de que la ventana anterior nos permite importar archivos `CSV <https://es.wikipedia.org/wiki/CSV>`_ en distintos formatos, lo mejor es importar un archivo en el formato adecuado para simplicar este proceso. Y pulsando este botón podemos descargar la factura en formato PDF: Tal y como se ha explicado con anterioridad, el proceso de tarificación es automático: Las llamadas aparecen en este listado en cuanto se cuelgan. Pasados unos minutos, el proceso que pone precios a las llamadas habrá tarificado la llamada (*Tarificado* igual a 'Sí') y tendremos disponible el **Precio** calculado. En ese momento, es posible que el futuro administrador de marca se haya dado cuenta de la titánica tarea que implicaría crear miles de patrones de precio (254 países por las distintas redes móviles, fijos, numeraciones especiales, etc.) para luego poder agruparlos en un plan de precios. En este punto, podemos generar la factura pulsando: Tarificación automática Antes de generar una factura de ejemplo, es importante entender que las facturas generadas utilizan unas plantillas que permiten su modificación. Facturación por segundos / minutos /etc. Llamadas facturables Retarificar una llamada consiste en volver a calcular el precio de la misma. Lógicamente, la retarificación se calculará en el momento solicitado, teniendo en cuenta las configuración actual de planes de precio y no las del momento del establecimiento de la llamada). Tarificar una llamada es la **acción de poner precio** a una llamada que implica coste. Tarificación y facturación Período de facturación Marca A nivel de marca. Por defecto, IvozProvider incluye las siguientes plantillas de ejemplo (en la ayuda contextual se pueden encontrar enlaces a las mismas): Formato CSV Histórico de llamadas Tarificación de llamadas Establecimiento de llamada Compañía  A nivel de empresa Precio por minuto Crear facturas que recojan el detalle y el consumo de sus empresas. Crear planes de precio para poner precio a las llamadas de los usuarios. Fecha Fecha y hora del establecimiento de la llamada. Destino Duración Estos listados muestran la siguiente información: En cada uno de los niveles se muestran las llamadas filtradas convenientemente. La fecha fin tiene que ser una fecha ya pasada. Es decir, no se puede sacar facturas de tramos futuros o del día actual. Precio de establecimiento Etc. Número externo al que se ha llamado. Los costes fijos son un concepto fijo que se pueden añadir a las facturas que utilicen plantillas que tengan en cuenta costes fijos. Costes fijos Los **números decimales** tienen que usar el **punto como separador decimal**. Si se pone a 1, implica una tarificación por segundos y cada segundo implicará un coste que será el *precio por minuto* dividido entre 60. Si se pone a 60, implica una tarificación por minutos y cada minuto implicará un coste que será el *precio por minuto*. Si no se va a poder tarificar atendiendo a los planes de precios activos para la empresa, la llamada no se cursará. Si se accede a una llamada concreta, se muestra información adicional sobre la misma. Esta información adicional depende del nivel (*god*, marca o empresa) y provee información sobre desvíos, transferencias, etc. Importación vía CSV En la sección :ref:`noplan_nocall` se hacía una introducción bastante completa sobre el proceso manual de creación de un plan de precios y los conceptos más importantes: Para retarificar, basta con seleccionar las llamadas en **Configuración de Marca** > **Llamada facturables** y presionar el botón **Tarificar llamadas**: En este último caso, el coste de la llamada se calcularía utilizando el plan de precio de menor métrica. Para estos casos, el *administrador de marca* puede re-tarificar las llamadas que considere mal tarificadas. Factura Creacion de una factura Generación de facturas Plantilla que queremos utilizar para generar esta factura Plantillas de facturas Se recomienda entrecomillar con comillas dobles las entradas alfanuméricas, aunque no es necesario para entradas con una única palabra (o entradas sin símbolos raros). **Si contienen coma, es OBLIGATORIO entrecomillarlos**. Puede ocurrir que una llamada se tarifique de forma incorrecta, por múltiples motivos: Añadamos ahora unos costes fijos a esta factura concreta pulsando: Muestra todas las llamadas de la marca emulada, indicando la empresa de cada una de ellas: Muestra todas las llamadas de la empresa emulada: Muestra todas las llamadas de la plataforma, indicando la marca y la empresa de cada una de ellas: A nivel global (*god*). A nivel global (god) Creación manual Retarificación manual Tarificado (sí/no) Plan de precio importado con una errata. Múltiples planes de precios con métricas incorrectas. Plan de precio adicional sin vincular. Número Las entradas numéricas se pueden entrecomillar con comillas dobles, pero no es obligatorio. En el momento en el que una llamada que implique coste se cuelga, aparece en el listado de :ref:`billable_calls`. Una vez elegido el archivo a importar, se nos presenta la siguiente ventana: Una vez completada la importación, solo faltaría asociar el nuevo plan de precios a las empresas que queramos, siguiendo :ref:`el procedimiento explicado en el bloque anterior <pricing_plan_to_company>`. Una empresa podía tener varios planes de precios en un momento concreto para una llamada concreta. Solo visible a nivel *god*, indica la marca de la empresa en cuestión. Contrato de peering Prefijo Pulsando el siguiente botón podemos ver las llamadas que han sido incluidas en la factura: Precio Precio por minuto Patrón de destino (que es en realidad el patrón de precio) Descripción del patrón de precio Nombre del patrón de precio Plan de precio Planes de precio Y añadamos los costes fijos que queramos, así como sus cantidades: Tarificado a 'Sí' Indica si la llamada está incluida en alguna :ref:`factura <invoices>`. Indica cuánto ha durado la llamada. Indica si el proceso que pone precio a las llamadas ha calculado el precio de esta llamada concreta. :ref:`Plan de precio <price_plan>` en base al cual se ha puesto precio a la llamada. Indica el :ref:`patrón de precio <price_pattern>` en base al cual se ha puesto precio a la llamada. Indica por qué :ref:`Contrato de peering <peering_contracts>` ha salido la llamada. Dado que ciertas llamadas entrantes pueden implicar coste (ver :ref:`tarificación de llamadas entrantes <bill_inbound>`), indica si la llamada es entrante o saliente. Pasados unos minutos, el proceso tarificador evaluará las llamadas tarificables sin coste y rellenará los siguientes campos del registro anterior: Fecha inicio/fin Sirva la siguiente imagen de ejemplo (sección **Costes Fijos**): Impuesto Impuesto a añadir al coste total calculado Plantilla Las plantillas son interpretadas con `handlebars <https://github.com/XaminProject/handlebars.php>`_ y renderizadas con la librería `wkhtmltopdf <https://wkhtmltopdf.org/>`_. Es por ello que el proceso de creación de planes y patrones de precio se realiza partiendo de un `CSV <https://es.wikipedia.org/wiki/CSV>`_. Empresa para la cual estamos generando la factura Coste calculado para la llamada. El objetivo final de todo el proceso de facturación es generar facturas que incluyan las llamadas con coste de una empresa concreta. El primer paso es crear un plan de precios vacío sobre el que importar nuestros precios (sección **Configuración de marca** > **Planes de precio**): La ayuda contextual de la sección **Configuración de Marca** > **Plantillas de facturas** incluye una explicación resumida del proceso de creación de plantillas. En la `página oficial de wkhtmltopdf <https://wkhtmltopdf.org/usage/wkhtmltopdf.txt>`_ puede encontrar más información. También puede profundicar en las expresiones disponibles en las plantillas `aquí <http://handlebarsjs.com/expressions.html>`_. El proceso de importación se realiza en segundo plano, permitiendo al administrador de marca seguir configurando otros aspectos de la plataforma mientras se completa. El sistema de importación creará los patrones de precio que sean necesarios. Si ya existe un patrón de precios con ese prefijo, no se creará, simplemente se vinculará. El orden de las columnas debería de ser: El precio de la llamada sera incrementado cada periodo de facturacion. El formato del archivo `CSV <https://es.wikipedia.org/wiki/CSV>`_ está explicado en la propia sección de ayuda contextual, que incluye un enlace para poder descargar un archivo de ejemplo: Tramo temporal cuyas llamadas queremos tener en cuenta Se muestra el coste asociado a las llamadas (una vez calculado) y, dado que las empresas son notificadas de sus llamadas por medio de facturas emitidas por el *operador de marca*, solo se existe a dos niveles: En este bloque se tratará un tema de primordial importancia para los administradores de marca: El botón clave para este proceso de importación masiva es el siguiente: Añadimos una factura nueva para explicar el proceso: De este modo, cada *operador de marca* puede crear plantillas con los datos deseados, la estética deseada, añadir logos y hasta gráficas de consumo. Tipo (entrante/saliente) Empresa responsable de la llamada. En esta ventana podríamos seleccionar qué contiene cada columna, en caso de no haber creado el `CSV <https://es.wikipedia.org/wiki/CSV>`_ en el formato recomendado. Del mismo modo, se nos ofrece la posibilidad de ignorar la primera línea, en caso de que incluya los nombres de las columnas en lugar de datos. Accedemos al listado (vacío) del plan de precio que acabamos de crear: Pare ello, abordaremos las siguientes cuestiones: A la hora de generar una factura, como se verá más adelante, se podrá indicar cuáles de estos conceptos se incluyen en la factura (y en qué cantidades). En el momento en el que una llamada se va a establecer, se verifica que se vaya a poder tarificar. Será incluído en la factura y representa el número de factura El exportador a `CSV <https://es.wikipedia.org/wiki/CSV>`_ permite exportar el listado para su posterior almacenamiento o procesado. 