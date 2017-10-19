��    ;      �              �  �   �  �   �  b        }     �     �  �   �     �  �   �  �   [  *   �  S   	  �   ]     	     )	  v   5	     �	     �	  %   �	  �   �	     �
     �
     �
  g   �
  s   #  z   �  J        ]     b     v  6   }     �  
   �  V   �          /    M  ?   S  B   �  .   �               '     9  s   E  a   �  �     ;   �  z   �  �   X  H   �  9   '  @   a     �  ?   �  �   �  <   �  �     ~  �  �   <  �   �  �   �     T     `     p    �  '   �  �   �  �   m  !     S   .  �   �     k     �  �   �          "  !   4  �   V     �     �       �   $  �   �  �   /  S   �                 %   6   -      d      p   \   |      �   #   �   +  !  T   8"  M   �"  2   �"     #     #     1#     F#     R#  k   �#  �   >$  O   �$  �   +%  �   �%  O   F&  @   �&  I   �&     !'  D   9'    ~'  /   �(  �   �(   **Direct connection PBX**: IvozProvider must be able to talk SIP directly with this kind of accounts by just redirecting the traffic to the proper port of the public IP address of the PBX. **PBX behind NAT**: Not directly accesible. This kind of PBX must register at IvozProvider (just like all the :ref:`Terminals <terminals>` do). *Account clients* MUST NOT challenge IvozProvider. That's why the *insecure* setting is used here. Account peer Account register Allowed codecs Although both **Contract peering** and **Retail accounts** are defined by the **brand operator**, the first ones are designed to connect with the public network while the second ones connect the system with other SIP agents. Asterisk as an account client At the other end of a account can be any kind of SIP entity. This section takes as example an Asterisk PBX system using SIP channel driver that wants to connect to IvozProvider. Calls forwarded by a filter will keep the original caller identification, adding the fordwarding info in a SIP *Diversion* header. Configuration will be something like this: Contrary to Friends, **Retail Accounts** have some simplifications and limitations. Contrary to the Virtual PBX companies, all Retail clients use the brand domain to unequivocally identify their accounts. You'll need to configure Brand's domain to use this feature. Country and Area code DDI filters DDIs are the external entry point from Contract Peerings to Retail Clients that can be routed through Retail Accounts. Description Direct connection External Destination for this filter. External calls from this *retail account* will be presented with this DDI, **unless the source presented matches a DDI belonging to the account**. Fallback Outgoing DDI Filters Configuration From domain If Retail Client has *Recordings* feature enabled, DDIs can also record incoming and/or outgoing calls. If the system can not be directly access, Asterisk will have to register in the platform (like a terminal will do). If you choose 'Yes' here, you'll have to fill the protocol, address and port where this *retail account* can be contacted. Like a other SIP entities, *retail accounts* will talk the selected codec. Name Name of the filter. Number Optional. Extra information for this *retail account*. Password Recordings Request from IvozProvider to this account will include this domain in the From header. Retail Accounts Retail Accounts Configuration Retail Accounts are the main routable option in Retail clients. More or less like :ref:`friends` are to Virtual PBX Companies, accounts contain the required configurable options to provide a SIP connectivity service with IvozProvider and an external SIP entity. Retail Accounts only place externals calls to Contract Peerings Retail Accounts only receive external calls from Contract Peerings Retail Accounts only route their assigned DDIs Retail Clients Retail DDI filters Retail DDI routes Retail DDIs Retail DDIs can only be routed to a :ref:`Retail Accounts <retail_accounts>` or :ref:`Virtual Fax <faxing_system>`. Retail External Filters can be assigned to DDIs to temporary forward calls to an external number. Retail clients are a special type of company that only provide a connectivity service with contract peerings through retail accounts. Retail clients can be enabled per Brand basis via Features. Routing a DDI through a Retail account will allow to place external calls from that account presenting that DDI as origin. The goal of this section will be describe each of the configuration settings associated with Retail clients included in IvozProvider. There are 2 main types of SIP PBX that can use retail with IvozProvider: These are the configurable settings of *Retail accounts*: This are the configurable settings of *Retail external filters*: Types of retail accounts Used for number transformation from and to this retail account. We can assign an **external call filter** configured in :ref:`previous section <retail_filters>`. Contrary to Virtual PBX External Call fiters, Retail DDIs filters only allow static redirection to another external number. What kind of calls can be routed through a *Retail Account*? When the *retail account* send requests, IvozProvider will authenticate it using this password. Like in other SIP agents in IvozProvider **using password IS A MUST**. Project-Id-Version: PROJECT VERSION
Report-Msgid-Bugs-To: EMAIL@ADDRESS
POT-Creation-Date: 2017-10-19 15:29+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: es <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 1.3
 **Centralitas con conectividad directa**: Esto implica que IvozProvider tiene la posibilidad de hablar SIP directamente sin más que dirigir su tráfico a una IP pública a un puerto concreto. **Centralitas tras NAT**: No accesibles directamente. Este tipo de centralitas tendran que registrarse en IvozProvider (exactamente igual que lo hacen los :ref:`Terminales <terminals>`) Los clientes tras cuentas no pueden desafiar a IvozProvider, al igual que un terminal no desafía a IvozProvider cuando éste le llama. De ahí el insecure. peer cuenta register cuenta Codecs permitidos A pesar de que tanto los **Contratos de peering** como **las cuentas Retail** son definidas por el **operador de marca**, los primeros están diseñados para connectar con la red publica mientras que los segundos se emplean para conectar el sistema con otros agentes SIP. Asterisk como cliente de cuenta retail" En el otro extremo de una cuenta puede haber cualquier entidad. Esta seccion toma como ejemplo una PBX Asterisk usando su driver de canal SIP que deseamos conectar a IvozProvider Las llamadas desviadas por un filtro mantendrán la identificación original del llamante, añadiendo los datos del desviador en una cabecera SIP *Diversion*. La configuración sería tal que: Contrary to Friends, **Retail Accounts** have some simplifications and limitations. Al contrario que las compañías de PBX virtual, todos los clientes Retail emplean el dominio de marca para identificar de manera inequívoca sus cuentas. Será preciso configurar el dominio de Marca para emplear esta funcionalidad. Pais y Código de area Filtros DDI Los DDIs son el punto de entrada externa desde Contratos de peering a Clientes Retail que se enrutarán a través de Cuentas de Retail. Descripcion Conexión directa Destino externo para este filtro. Las llamadas externas de esta *cuenta retail* presentarán este DDI, **a no ser que el DDI presentado sea uno de los asociados a la cuenta**. DDI Saliente alternativo Configuración de Filtros Dominio From Si el Cliente Retail tiene la feature *Grabaciones* habilitada, los DDIs también podrán grabar las llamadas salientes y/o entrantes· En caso de no estar directamente visible, el Asterisk tendrá que registrarse en IvozProvider (al igual que hacen los terminales). Si elijes 'Sí' aquí, tendras que informar el protocol, dirección y puerto donde se enviarán las peticiones de esta *cuenta retail*. Como otras entidades SIP, las *cuentas retail* hablarán en el códec seleccionado. Nombre Nombre del filtro. Número Opcional. Información extra para esta *cuenta retail* Contraseña Grabaciones Las peticiones desde IvozProvider a esta cuenta incluirán este dominio en la cabecera From. Cuentas Retail Configuracion de las cuentas retail Las cuentas Retail son la principal opción enrutable de los clientes Retail. Semejantes a los :ref:`friends` en las compañías de PBX Virtual, las cuentas tienen todas las opciones de configuración necesarias para proveer un servicio de connectividad entre IvozProvider y una entidad SIP externa. Las cuentas Retail solo realizan llamadas externas a través de Contratos de peering Las cuentas Retail sólo reciben llamadas externas desde Contratos de peering Las cuentas Retail solo enrutan sus DDIs asignados Clientes Retail Filtros DDI Retail Rutas de DDI Retail" DDIs Retail Los DDI de Retail solo pueden ser enrutados a :ref:`Cuentas Retail <retail_accounts>` o :ref:`Faxes Virtuales <faxing_system>`. Los Filtros Externos de Retail pueden asignarse a DDIs permitiendo un desvío temporal a números externos. Los clientes Retail son un tipo especial de compañía que solo provee un servicio de conectividad con los contratos de peering a través de cuentas retail. Los clientes Retail pueden ser habilitados en las Marcas a través de Features. Enrutar un DDI a través de una Cuenta Retail permitirá realizar llamadas externas desde esa cuenta presentando dicho DDI como origen. El objetivo de esta sección será describir cada una de las opciones de configuración asociadas a los clientes Retail incluidas en IvozProvider. Hay dos tipos principales de PBX SIP que puede emplear retail con IvozProvider: Estas son las opciones de configuracion de las *Cuentas retail*: Estas son las opciones configurables de los *Filtros externos de Retail*: Tipos de cuentas retail Empleado para las transformaciones numéricas de esta cuenta retail. Podemos asignar un **filtro de entrada** configurado en :ref:`la anterior sección <retail_filters>`. Al contrario que los filtros externos disponibles en las PBX Virtuales, los filtros de los DDI de Retail tan solo proporcionan un desvío estático a un número externo. ¿Qué llamadas se envían a una cuenta retail? Cuando una *cuenta retail* envia peticiones, IvozProvider se autenticará empleando esta contraseña. Como en otros agentes SIP en IvozProvider **emplear contraseña ES OBLIGATORIO**. 